import 'dart:convert';

// import 'package:api_quran/models/detail_surah.dart';
import 'package:api_quran/models/surah.dart';
import 'package:http/http.dart';

class HttpService {
  String baseUrl = "https://quran-api.santrikoding.com/api";

  Future<List<Surah>> getSurah() async {
    Response response = await get(Uri.parse('$baseUrl/surah'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Surah> surah = body.map(
        (dynamic item) => Surah.fromJson(item),
      ).toList();

      return surah;
    } else {
      throw "Unable to get data";
    }
  }

  Future<Surah> showSurah(int nomor) async {
    Response response = await get(Uri.parse('$baseUrl/surah/$nomor'));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return Surah.fromJson(body);
    } else {
      throw "Unable to get data";
    }
  }
}