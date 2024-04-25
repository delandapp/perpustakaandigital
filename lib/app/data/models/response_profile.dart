/// Status : 200
/// Message : "Berhasil Menampilkan Profil"
/// data : {"id":2,"username":"ryan fahrezi","email":"ryanfahrezi@smk.belajar.id","Level":"User","Nama Lengkap":"","No Telp":"","Alamat":""}

class ResponseProfile {
  ResponseProfile({
      this.status, 
      this.message, 
      this.data,});

  ResponseProfile.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataProfile.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataProfile? data;

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

/// id : 2
/// username : "ryan fahrezi"
/// email : "ryanfahrezi@smk.belajar.id"
/// Level : "User"
/// Nama Lengkap : ""
/// No Telp : ""
/// Alamat : ""

class DataProfile {
  DataProfile({
      this.id, 
      this.username, 
      this.email, 
      this.level, 
      this.namaLengkap, 
      this.noTelp, 
      this.alamat,});

  DataProfile.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    level = json['Level'];
    namaLengkap = json['Nama Lengkap'];
    noTelp = json['No Telp'];
    alamat = json['Alamat'];
  }
  int? id;
  String? username;
  String? email;
  String? level;
  String? namaLengkap;
  String? noTelp;
  String? alamat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['Level'] = level;
    map['Nama Lengkap'] = namaLengkap;
    map['No Telp'] = noTelp;
    map['Alamat'] = alamat;
    return map;
  }

}