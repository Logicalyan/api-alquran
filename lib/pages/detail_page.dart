import 'package:api_quran/models/surah.dart';
import 'package:api_quran/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailPage extends StatefulWidget {
  final int nomor;

  const DetailPage({super.key, required this.nomor});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final HttpService httpService = HttpService();
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color(0xFFCD9933)),
        backgroundColor: const Color(0xFF0A3D2E),
        title: Text(
          'Surah ${widget.nomor}',
          style: const TextStyle(color:  Color(0xFFCD9933), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.nightlight_round, color: const Color(0xFFCD9933)),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: isDarkMode ? const Color(0xFF0A3D2E) : Colors.white,
      body: FutureBuilder(
          future: httpService.showSurah(widget.nomor),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              Surah detail = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Card(
                      color: isDarkMode ? Colors.black.withOpacity(0.2) : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                detail.namaLatin,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? const Color(0xFFCD9933) : Colors.black),
                              ),
                            ),
                            ListTile(
                              title: Html(data: detail.deskripsi)
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: detail.ayat!.length,
                      itemBuilder: (context, index) {
                        Ayat ayat = detail.ayat![index];
                        return Card(
                          color: isDarkMode ? Colors.black.withOpacity(0.2) : Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: const Color.fromARGB(255, 7, 84, 61),
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    ayat.nomor.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                title: Text(
                                  ayat.ar,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode ? const Color(0xFFCD9933) : Colors.black),
                                ),
                                subtitle: Text(
                                  ayat.idn,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14, color: isDarkMode ? const Color(0xFFCD9933) : Colors.black),
                                ),
                              )),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No data available",
                  style: TextStyle(
                      fontSize: 16, color: isDarkMode ? const Color(0xFFCD9933) : Colors.black),
                ),
              );
            }
          }),
    );
  }
}
