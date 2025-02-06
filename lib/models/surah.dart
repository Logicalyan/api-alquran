class Surah {
  int nomor;
  String nama;
  String namaLatin;
  String tempatTurun;
  String arti;
  int jumlahAyat;
  String deskripsi;
  List<Ayat>? ayat;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.tempatTurun,
    required this.arti,
    required this.jumlahAyat,
    required this.deskripsi,
    required this.ayat
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayatList = json['ayat'] as List?;
    List<Ayat>? ayat = ayatList?.map((i) => Ayat.fromJson(i)).toList();
    return Surah(
      nomor: json['nomor'] as int,
      nama: json['nama'] as String,
      namaLatin: json['nama_latin'] as String,
      tempatTurun: json['tempat_turun'] as String,
      arti: json['arti'] as String,
      jumlahAyat: json['jumlah_ayat'] as int,
      deskripsi: json['deskripsi'] as String,
      ayat: ayat
    );
  }

  map(Type ayat) {}
}

class Ayat {
    int id;
    int surah;
    int nomor;
    String ar;
    String tr;
    String idn;

    Ayat({
        required this.id,
        required this.surah,
        required this.nomor,
        required this.ar,
        required this.tr,
        required this.idn,
    });

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
    );
}
