import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;

// Dashboard
// class DashboardKen{
//   String mahasiswa, dosen, matakuliah, jadwal, nim_progmob;
//   DashboardKen({
//     this.mahasiswa, this.dosen, this.matakuliah, this.jadwal, this.nim_progmob
//   });
//   factory DashboardKen.fromJson(Map<String, dynamic> map) {
//     return DashboardKen(mahasiswa: map["mahasiswa"], dosen: map["dosen"], matakuliah: map["matakuliah"], jadwal: map["jadwal"], nim_progmob: map["nim_progmob"]);
//   }
//   Map<String, dynamic> toJson() {
//     return {"mahasiswa": mahasiswa, "dosen": dosen,
//       "matakuliah": matakuliah, "jadwal": jadwal,
//       "nim_progmob": nim_progmob};
//   }
//   @override
//   String toString() {
//     return 'DashboardKen{mahasiswa: $mahasiswa, dosen: $dosen, '
//         'matakuliah: $matakuliah, jadwal: $jadwal, '
//         'nim_progmob: $nim_progmob}';
//   }
// }
// List<DashboardKen> dashboardkenFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<DashboardKen>.from(data.map((item) => DashboardKen.fromJson(item)));
// }
// String dashboardkenToJson(DashboardKen data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }

class DashboardKen {
  final String mahasiswa, dosen, matakuliah, jadwal, nim_progmob;

  DashboardKen({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal, this.nim_progmob});

  factory DashboardKen.fromJson(Map<String, dynamic> json) {
    return DashboardKen(
      mahasiswa: json['mahasiswa'],
      dosen: json['dosen'],
      matakuliah: json['matakuliah'],
      jadwal: json['jadwal'],
      nim_progmob: json['nim_progmob'],
    );
  }
}

// Mahasiswa
class Mahasiswa{
  String id, nama, nim, alamat, email, foto, nim_progmob;
  Mahasiswa({
    this.id, this.nama, this.nim, this.alamat,
    this.email, this.foto, this.nim_progmob
  });
  factory Mahasiswa.fromJson(Map<String, dynamic> map) {
    return Mahasiswa(id: map["id"], nama: map["nama"], nim: map["nim"], alamat: map["alamat"],
        email: map["email"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama,
      "nim": nim, "alamat": alamat,
      "email": email, "foto": foto,
      "nim_progmob": nim_progmob};
  }
  @override
  String toString() {
    return 'Mahasiswa{id: $id, nama: $nama, '
        'nim: $nim, alamat: $alamat, '
        'email: $email, '
        'foto: $foto, '
        'nim_progmob: $nim_progmob}';
  }
}
List<Mahasiswa> mahasiswaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}
String mahasiswaToJson(Mahasiswa data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// Dosen
class Dosen{
  String id, nama, nidn, alamat, email, gelar, foto, nim_progmob;
  Dosen({
    this.id, this.nama, this.nidn, this.alamat,
    this.email, this.gelar, this.foto, this.nim_progmob
  });
  factory Dosen.fromJson(Map<String, dynamic> map) {
    return Dosen(id: map["id"], nama: map["nama"], nidn: map["nidn"], alamat: map["alamat"],
        email: map["email"], gelar: map["gelar"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama,
      "nidn": nidn, "alamat": alamat, "email": email,
      "foto": foto, "nim_progmob": nim_progmob};
  }
  @override
  String toString() {
    return 'Dosen{id: $id, nama: $nama, '
        'nidn: $nidn, alamat: $alamat, '
        'email: $email, foto: $foto, '
        'nim_progmob: $nim_progmob}';
  }
}
List<Dosen> dosenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}
String dosenToJson(Dosen data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// Matakuliah
class Matakuliah{
  String id, kode, nama, nim_progmob, hari, sesi, sks;
  Matakuliah({this.id, this.kode, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});
  factory Matakuliah.fromJson(Map<String, dynamic> map) {
    return Matakuliah(id: map["id"], kode: map["kode"], nama: map["nama"], hari: map["hari"],
        sks: map["sks"], sesi: map["sesi"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson() => <String, dynamic> {
    "id": id, "kode": kode, "nama": nama,
    "hari": hari, "sesi": sesi,
    "sks": sks, "nim_progmob": nim_progmob
  };
  @override
  String toString() {
    return 'Matakuliah{id: $id, kode: $kode, '
        'nama: $nama, hari: $hari, '
        'sesi: $sesi, sks: $sks, '
        'nim_progmob: $nim_progmob}';
  }
}
List<Matakuliah> matkulFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}
String matkulToJson(Matakuliah data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//Jadwal
class Jadwal{
  String id, id_matkul, id_dosen, nidn, hari, sesi, sks, nim_progmob;
  Jadwal({this.id, this.id_matkul, this.id_dosen, this.nidn, this.hari, this.sesi, this.sks, this.nim_progmob});
  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(id: map["id"], id_matkul: map["matkul"], id_dosen: map["dosen"], nidn: map["nidn"],
        hari: map["hari"], sks: map["sks"], sesi: map["sesi"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson() => <String, dynamic> {
    "id": id, "id_matkul": id_matkul, "id_dosen": id_dosen,
    "nidn": nidn,
    "hari": hari,
    "sesi": sesi,
    "sks": sks,
    "nim_progmob": nim_progmob
  };
  @override
  String toString() {
    return 'Jadwal{id: $id, matkul: $id_matkul, dosen: $id_dosen, '
        'nidn: $nidn, '
        'hari: $hari, '
        'sesi: $sesi, '
        'sks: $sks, '
        'nim_progmob: $nim_progmob}';
  }
}
List<Jadwal> jadwalFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
}
String jadwalToJson(Jadwal data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// ChaRT NYA
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha
  );
}
//Login
class LoginIn{
  String id, nimnik, password, nama, email, is_admin;

  //konstruktor
  LoginIn({this.id, this.nimnik, this.password, this.nama, this.email, this.is_admin});

  factory LoginIn.createLoginResult(Map<String, dynamic> map) {
    return LoginIn(
      id: map['id'],
      nimnik: map['nimnik'],
      password: map['password'],
    );
  }

  //mapping dr json ke object
  factory LoginIn.fromJson(Map<String, dynamic> map){
    return LoginIn(
        nimnik: map["nimnik"],
        password: map["password"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"nimnik": nimnik, "password": password};
  }

  @override
  String toString() {
    return 'LoginIn{nimnik: $nimnik, password: $password}';
  }
}

List<LoginIn> loginFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<LoginIn>.from(data.map((item) => LoginIn.fromJson(item)));
}

String loginToJson(LoginIn data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}