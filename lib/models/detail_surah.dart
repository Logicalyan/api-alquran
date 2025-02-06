
// class DetailSurah {
//     bool status;
//     int nomor;
//     String nama;
//     int jumlahAyat;
//     String namaLatin;
//     String arti;
//     String tempatTurun;
//     String deskripsi;
//     String audio;
//     List<Ayat> ayat;
//     SuratSelanjutnya suratSelanjutnya;
//     bool suratSebelumnya;

//     DetailSurah({
//         required this.status,
//         required this.nomor,
//         required this.nama,
//         required this.jumlahAyat,
//         required this.namaLatin,
//         required this.arti,
//         required this.tempatTurun,
//         required this.deskripsi,
//         required this.audio,
//         required this.ayat,
//         required this.suratSelanjutnya,
//         required this.suratSebelumnya,
//     }); 

//     factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
//         status: json["status"],
//         nomor: json["nomor"],
//         nama: json["nama"],
//         jumlahAyat: json["jumlah_ayat"],
//         namaLatin: json["nama_latin"],
//         arti: json["arti"],
//         tempatTurun: json["tempat_turun"],
//         deskripsi: json["deskripsi"],
//         audio: json["audio"],
//         ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
//         suratSelanjutnya: SuratSelanjutnya.fromJson(json["surat_selanjutnya"]),
//         suratSebelumnya: json["surat_sebelumnya"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "nomor": nomor,
//         "nama": nama,
//         "jumlah_ayat": jumlahAyat,
//         "nama_latin": namaLatin,
//         "arti": arti,
//         "tempat_turun": tempatTurun,
//         "deskripsi": deskripsi,
//         "audio": audio,
//         "ayat": List<Ayat>.from(ayat.map((x) => x.toJson())),
//         "surat_selanjutnya": suratSelanjutnya.toJson(),
//         "surat_sebelumnya": suratSebelumnya,
//     };
// }



// class SuratSelanjutnya {
//     int id;
//     int nomor;
//     String nama;
//     String namaLatin;
//     int jumlahAyat;
//     String tempatTurun;
//     String arti;
//     String deskripsi;
//     String audio;

//     SuratSelanjutnya({
//         required this.id,
//         required this.nomor,
//         required this.nama,
//         required this.namaLatin,
//         required this.jumlahAyat,
//         required this.tempatTurun,
//         required this.arti,
//         required this.deskripsi,
//         required this.audio,
//     });

//     factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) => SuratSelanjutnya(
//         id: json["id"],
//         nomor: json["nomor"],
//         nama: json["nama"],
//         namaLatin: json["nama_latin"],
//         jumlahAyat: json["jumlah_ayat"],
//         tempatTurun: json["tempat_turun"],
//         arti: json["arti"],
//         deskripsi: json["deskripsi"],
//         audio: json["audio"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "nomor": nomor,
//         "nama": nama,
//         "nama_latin": namaLatin,
//         "jumlah_ayat": jumlahAyat,
//         "tempat_turun": tempatTurun,
//         "arti": arti,
//         "deskripsi": deskripsi,
//         "audio": audio,
//     };
// }
