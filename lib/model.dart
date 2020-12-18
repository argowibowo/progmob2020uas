import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//----------------------------Chart--------------------------------
class CliksPerYaer{
  final String year;
  final String cliks;
  final charts.Color color;

  CliksPerYaer(this.year, this.cliks, charts.Color color)
      :this.color = charts.Color();
}
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
}
List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}
String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//---------------------------daftar dosen-----------------------------

class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar, this.foto,
    this. nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map){
    return Dosen(id: map['id'], nama: map['nama'], nidn: map['nidn'], alamat: map['alamat'],
        gelar: map ['gelar'], email: map['email'], foto: map['foto'], nim_progmob: map['nim_progmob']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email, "gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}
String dosenToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//---------------------------daftar matakuliah-----------------------------
class Matakuliah{
  String id;
  String nama;
  String kode;
  int hari ;
  int sesi;
  int sks;
  String nim_progmob;

  Matakuliah({this.id, this.nama, this.kode, this.hari, this.sesi, this.sks, this.nim_progmob});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(
        id: map["id"],
        nama: map["nama"],
        kode: map["kode"],
        hari: int.parse(map["hari"]),
        sesi: int.parse(map["sesi"]),
        sks: int.parse(map["sks"]),
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "kode": kode, "hari": hari,
      "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
  }
}

List<Matakuliah> matakuliahFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matakuliahToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//---------------------------daftar jadwal-----------------------------
class Jadwal{
  String id;
  String matkul;
  String dosen;
  String nidn;
  int hari;
  int sesi;
  int sks;
  String nim_progmob;

  Jadwal({this.id, this.matkul, this.dosen, this.nidn, this.hari,
    this.sesi, this.sks, this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"],
        matkul: map["matkul"],
        dosen: map["dosen"],
        nidn: map["nidn"],
        hari: int.parse(map["hari"]),
        sesi: int.parse(map["sesi"]),
        sks: int.parse(map["sks"]),
        nim_progmob: map["nim_progmob"]
    );
  }
  Map<String, dynamic> toJson(){
    return{"id":id, "matkul": matkul, "dosen": dosen, "nidn": nidn, "hari": hari,
      "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
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


//---------------------------login-----------------------------
class LoginResponseModel{
  final String token;
  final String error;

  LoginResponseModel({this.token,this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic>json){
    return LoginResponseModel(token: json["token"] != null ? json["token"]:"",error: json["error"] != null ? json["error"]:"");
  }
}

/*class User {
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
List<User> userFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJson(item)));
}

String userToJson(Jadwal data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}*/
