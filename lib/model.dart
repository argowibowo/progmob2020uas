import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:';
import 'package:flutter/material.dart';
//----------------------------Chart--------------------------------
// class CliksPerYaer{
//   final String year;
//   final String cliks;
//   final charts.Color color;
//
//   CliksPerYaer(this.year, this.cliks, charts.Color color)
//       :this.color = charts.Color();
// }
//---------------------------Dashboard-----------------------------
class DashboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json){
    return DashboardSI(
        mahasiswa: json['mahasiswa'],
        dosen: json['dosen'],
        matakuliah: json['matakuliah'],
        jadwal: json['jadwal']
    );
  }
}
//---------------------------daftar mahasiswa-----------------------------
class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({this.id, this.nama, this.nim, this.alamat, this.email, this.foto,
    this. nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(id: map['id'], nama: map['nama'], nim: map['nim'], alamat: map['alamat'],
        email: map['email'], foto: map['foto'], nim_progmob: map['nim_progmob']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nim": nim, "alamat": alamat, "email": email, "foto": foto, "nim_progmob": nim_progmob};
  }

// @override
// String toString() {
//   return 'Mahasiswa(id: $id, nama: $nama, nim: $alamat, email: $email, foto: $foto, nim_progmob: $nim_progmob)';
// }

}

List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}
String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

/////////////////////////DOSEN//////////////////////////////////////

class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar,
    this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String,dynamic>map){
    return Dosen(id: map["id"],nama: map["nama"],nidn: map["nidn"],alamat: map["alamat"],email: map["email"],gelar: map["gelar"],foto: map["foto"],nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email,"gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}
String DosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

///////////////MATAKULIAH/////////////////
class Matkul{
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Matkul({this.id, this.kode, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});

  factory Matkul.fromJson(Map<String, dynamic> map){
    return Matkul(
        id: map["id"], kode: map["kode"], nama: map["nama"], hari: map["hari"], sesi: map["sesi"], sks: map["sks"], nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "kode": kode, "nama": nama, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
  }

}

List<Matkul> matkulFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matkul>.from(data.map((item) => Matkul.fromJson(item)));
}

String matkulToJson(Matkul data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

///////////////KRS////////////////
class Krs{
  String id;
  String kode;
  String nama_matkul;
  String nidn;
  String dosen;
  String gelar;
  String hari;
  String sesi;
  String sks;
  String mhs;
  String nim;
  String nim_progmob;

  Krs({this.id, this.kode, this.nama_matkul, this.nidn, this.dosen, this.gelar, this.hari, this.sesi, this.sks, this.mhs, this.nim, this.nim_progmob});

  factory Krs.fromJson(Map<String, dynamic> map){
    return Krs(
        id: map["id"], kode: map["kode"], nama_matkul: map["nama_matkul"], nidn: map["nidn"],
        dosen: map["dosen"], gelar: map["gelar"], hari: map["hari"], sesi: map["sesi"], sks: map["sks"], mhs: map["mhs"], nim: map["nim"], nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "kode": kode, "nama_matkul": nama_matkul, "nidn": nidn, "dosen": dosen, "gelar": gelar, "hari": hari, "sesi": sesi, "sks": sks, "mhs": mhs, "nim": nim, "nim_progmob": nim_progmob};
  }
}
List<Krs> krsFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Krs>.from(data.map((item) => Krs.fromJson(item)));
}

String krsToJson(Krs data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

///////////////JADWAL////////////////
class Jadwal{
  String id;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;
  Jadwal({this.id, this.matkul, this.nidn, this.dosen,  this.hari, this.sesi, this.sks,  this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"], matkul: map["matkul"], nidn: map["nidn"],
        dosen: map["dosen"], hari: map["hari"], sesi: map["sesi"], sks: map["sks"], nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "matkul": matkul, "nidn": nidn, "dosen": dosen, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
  }
}
List<Jadwal> jadwalFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
}

String jadwalToJson(Jadwal data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
/////////////USER///////////////
class LoginResponseModel{
  final String token;
  final String error;

  LoginResponseModel({this.token,this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic>json){
    return LoginResponseModel(token: json["token"] != null ? json["token"]:"",error: json["error"] != null ? json["error"]:"");
  }
}

class User {
  String id;
  String nama;
  String nimnik;
  String email;
  String password;
  String is_admin;

  User({
    this.nama,
    this.nimnik,
    this.email,
    this.password,
    this.is_admin
  });
  Map<String, dynamic>toJson(){
    Map<String, dynamic> map = {
      "nama":nama.trim(),
      "nimnik":nimnik.trim(),
      "email":email.trim(),
      "password":password.trim(),
      "is_admin":is_admin.trim()
    };
    return map;
  }
}