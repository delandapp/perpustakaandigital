/// Status : 200
/// Message : "Berhasil Get Kategori Buku"
/// data : [{"KategoriID":1,"NamaKategori":"Teknologi","created_at":"2024-03-06T15:15:52.000000Z","updated_at":"2024-03-06T15:15:52.000000Z"},{"KategoriID":2,"NamaKategori":"Percintaan","created_at":"2024-03-06T15:16:05.000000Z","updated_at":"2024-03-06T15:16:05.000000Z"},{"KategoriID":3,"NamaKategori":"Pendidikan","created_at":"2024-03-06T15:16:10.000000Z","updated_at":"2024-03-06T15:16:10.000000Z"},{"KategoriID":4,"NamaKategori":"Petualangan","created_at":"2024-03-06T15:16:15.000000Z","updated_at":"2024-03-06T15:16:15.000000Z"},{"KategoriID":5,"NamaKategori":"Horor","created_at":"2024-03-06T15:16:20.000000Z","updated_at":"2024-03-06T15:16:20.000000Z"},{"KategoriID":6,"NamaKategori":"Sexsual","created_at":"2024-03-07T03:26:52.000000Z","updated_at":"2024-03-07T03:26:52.000000Z"}]

class ResponseKategori {
  ResponseKategori({
      this.status, 
      this.message, 
      this.data,});

  ResponseKategori.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKategori.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataKategori>? data;

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

/// KategoriID : 1
/// NamaKategori : "Teknologi"
/// created_at : "2024-03-06T15:15:52.000000Z"
/// updated_at : "2024-03-06T15:15:52.000000Z"

class DataKategori {
  DataKategori({
      this.kategoriID, 
      this.namaKategori, 
      this.createdAt, 
      this.updatedAt,});

  DataKategori.fromJson(dynamic json) {
    kategoriID = json['KategoriID'];
    namaKategori = json['NamaKategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? kategoriID;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriID'] = kategoriID;
    map['NamaKategori'] = namaKategori;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}