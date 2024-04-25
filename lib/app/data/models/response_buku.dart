/// Status : 200
/// Message : "Berhasil Menampilkan All Buku"
/// data : [{"KategoriBuku":"Horor","Buku":[{"BukuID":4,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/Coba.png","Judul":"Coba","Penulis":"Muhammad Deland","Penerbit":"Yogha Irgi","TahunTerbit":"2029","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0}]},{"KategoriBuku":"Romance","Buku":[{"BukuID":5,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/Senja.png","Judul":"Senja","Penulis":"Muhammad Deland","Penerbit":"Yogha Irgi","TahunTerbit":"2029","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0}]},{"KategoriBuku":"Sexsual","Buku":[]},{"KategoriBuku":"Primitive","Buku":[]}]

class ResponseBuku {
  ResponseBuku({
      this.status, 
      this.message, 
      this.data,});

  ResponseBuku.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBuku>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// KategoriBuku : "Horor"
/// Buku : [{"BukuID":4,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/Coba.png","Judul":"Coba","Penulis":"Muhammad Deland","Penerbit":"Yogha Irgi","TahunTerbit":"2029","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0}]

class DataBuku {
  DataBuku({
      this.kategoriBuku, 
      this.buku,});

  DataBuku.fromJson(dynamic json) {
    kategoriBuku = json['KategoriBuku'];
    if (json['Buku'] != null) {
      buku = [];
      json['Buku'].forEach((v) {
        buku?.add(Buku.fromJson(v));
      });
    }
  }
  String? kategoriBuku;
  List<Buku>? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriBuku'] = kategoriBuku;
    if (buku != null) {
      map['Buku'] = buku?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 4
/// CoverBuku : "http://127.0.0.1:8000/storage/images/coverbook/Coba.png"
/// Judul : "Coba"
/// Penulis : "Muhammad Deland"
/// Penerbit : "Yogha Irgi"
/// TahunTerbit : "2029"
/// JumlahHalaman : "214"
/// Rating : 0
/// Total_ulasan : 0
/// JumlahRating : 0
/// JumlahPeminjam : 0

class Buku {
  Buku({
      this.bukuID, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam,});

  Buku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
  }
  int? bukuID;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['CoverBuku'] = coverBuku;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['JumlahHalaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    return map;
  }

}