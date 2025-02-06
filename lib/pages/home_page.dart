
// import 'package:api_quran/models/detail_surah.dart';
import 'package:api_quran/models/surah.dart';
import 'package:api_quran/pages/detail_page.dart';
import 'package:api_quran/services/http_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final HttpService httpService = HttpService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Quran'),
      ),
      body: FutureBuilder(
          future: httpService.getSurah(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final surah = snapshot.data!;
              return ListView(
                  children: surah
                      .map((Surah surah) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(0.05),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(8)),
                              tileColor: Colors.black.withOpacity(0.05),
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                child: Text(
                                  "${surah.nomor}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                              title: Text(
                                  "${surah.namaLatin} ( ${surah.nama} )"),
                              subtitle: Text(
                                  "${surah.arti} | ${surah.jumlahAyat} Ayat"),
                              trailing: ElevatedButton(
                                  onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder:(context) => DetailPage(nomor: surah.nomor,)));
                                  }, child: const Text('Baca')),
                            ),
                          ))
                      .toList());
            } else {
              return const Text("No data available");
            }
          }),
    );
  }



  // Future<void> _dialog(BuildContext context) {
  //   finalSurah surah;
  //   return showDialog(context: context, builder: (BuildContext context){
  //     return AlertDialog(
  //       title: Text(surah.nama),
  //     );
  //   });
  // }

}
