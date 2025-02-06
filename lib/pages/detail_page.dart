// import 'package:api_quran/models/detail_surah.dart';
import 'package:api_quran/models/surah.dart';
import 'package:api_quran/services/http_service.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  final int nomor;

  DetailPage({super.key, required this.nomor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Quran $nomor'),
      ),
      body: FutureBuilder(
          future: httpService.showSurah(nomor),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              Surah detail = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Surah ${detail.namaLatin}"),
                    Text("${detail.jumlahAyat} ayat"),
                    Text("Tempat turun:  ${detail.tempatTurun}"),
                    if(detail.ayat != null)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: detail.ayat!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Ayat ayat = detail.ayat![index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ayat ${ayat.nomor}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  ayat.ar,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                
                                SizedBox(height: 10),
                                Text(
                                  ayat.idn,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Text("No data available");
            }
          }),
    );
  }
}
