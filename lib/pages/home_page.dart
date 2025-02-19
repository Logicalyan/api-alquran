import 'package:api_quran/pages/detail_page.dart';
import 'package:api_quran/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A3D2E),
        title: Text(
          'Quran App',
          style: GoogleFonts.poppins(
              color:const Color(0xFFCD9933), fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round, color: Colors.white),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: isDarkMode ? const Color(0xFF0A3D2E) : Colors.white,
      body: FutureBuilder(
          future: httpService.getSurah(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final surah = snapshot.data!;
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: surah.length,
                itemBuilder: (context, index) {
                  final item = surah[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(nomor: item.nomor)));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isDarkMode ? Colors.black.withOpacity(0.2) : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: isDarkMode ? const Color(0xFFCD9933) : const Color.fromARGB(255, 7, 84, 61), // Warna emas
                          foregroundColor: Colors.white,
                          radius: 24,
                          child: Text(
                            "${item.nomor}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          "${item.namaLatin} ( ${item.nama} )",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? const Color(0xFFCD9933) : Colors.black),
                        ),
                        subtitle: Text(
                          "${item.arti} | ${item.jumlahAyat} Ayat",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: isDarkMode ? const Color(0xFFCD9933) : Colors.grey[700]),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: isDarkMode ? const Color(0xFFCD9933) : const Color(0xFFCD9933),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No data available",
                    style: TextStyle(fontSize: 16, color: Colors.red)),
              );
            }
          }),
    );
  }
}