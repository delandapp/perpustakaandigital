/// Status : 200
/// Message : "Berhasil Menampilkan All Buku"
/// data : [{"BukuID":9,"Deskripsi":"Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata","CoverBuku":"http://192.168.1.3:8000/storage/images/coverbook/Lakukan Semaunya.jpeg","Judul":"Lakukan Semaunya","Penulis":"Anisa Ramadani","Penerbit":"Athila davin","TahunTerbit":"2024","JumlahHalaman":"214","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Kategori":["Percintaan"]}]

class ResponseBookSearch {
  ResponseBookSearch({
      this.status, 
      this.message, 
      this.data,});

  ResponseBookSearch.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBukuSearch.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBukuSearch>? data;

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

/// BukuID : 9
/// Deskripsi : "Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata"
/// CoverBuku : "http://192.168.1.3:8000/storage/images/coverbook/Lakukan Semaunya.jpeg"
/// Judul : "Lakukan Semaunya"
/// Penulis : "Anisa Ramadani"
/// Penerbit : "Athila davin"
/// TahunTerbit : "2024"
/// JumlahHalaman : "214"
/// Rating : 0
/// Total_ulasan : 0
/// JumlahRating : 0
/// JumlahPeminjam : 0
/// Kategori : ["Percintaan"]

class DataBukuSearch {
  DataBukuSearch({
      this.bukuID, 
      this.deskripsi, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.kategori,});

  DataBukuSearch.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
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
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
  }
  int? bukuID;
  String? deskripsi;
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
  List<String>? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
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
    map['Kategori'] = kategori;
    return map;
  }

}