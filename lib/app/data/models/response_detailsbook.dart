/// Status : 200
/// Message : "Berhasil Menampilkan Buku"
/// data : {"BukuID":28,"Deskripsi":"Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata","CoverBuku":"http://192.168.1.17:8000/storage/images/coverbook/Danur.jpeg","judul_buku":"Danur","penulis_buku":"Anisa Ramadani","penerbit_buku":"Athila davin","tahun_terbit":"2024","jumlah_halaman":"214","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Kategori":["Horor"],"Koleksi":true}

class ResponseDetailsbook {
  ResponseDetailsbook({
      this.status, 
      this.message, 
      this.data,});

  ResponseDetailsbook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataBookDetails.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataBookDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// BukuID : 28
/// Deskripsi : "Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata"
/// CoverBuku : "http://192.168.1.17:8000/storage/images/coverbook/Danur.jpeg"
/// judul_buku : "Danur"
/// penulis_buku : "Anisa Ramadani"
/// penerbit_buku : "Athila davin"
/// tahun_terbit : "2024"
/// jumlah_halaman : "214"
/// Rating : 0
/// Total_ulasan : 0
/// JumlahRating : 0
/// JumlahPeminjam : 0
/// Kategori : ["Horor"]
/// Koleksi : true

class DataBookDetails {
  DataBookDetails({
      this.bukuID, 
      this.deskripsi, 
      this.coverBuku, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.kategori, 
      this.koleksi,});

  DataBookDetails.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
    coverBuku = json['CoverBuku'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunTerbit = json['tahun_terbit'];
    jumlahHalaman = json['jumlah_halaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
    koleksi = json['Koleksi'];
  }
  int? bukuID;
  String? deskripsi;
  String? coverBuku;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  List<String>? kategori;
  bool? koleksi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
    map['CoverBuku'] = coverBuku;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_terbit'] = tahunTerbit;
    map['jumlah_halaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Kategori'] = kategori;
    map['Koleksi'] = koleksi;
    return map;
  }

}