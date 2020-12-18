import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


//--------------chart-----------------------
class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;


  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b:color.blue, a: color.alpha);
}

//--------------dashboard----------------------
class DashboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json){
    return DashboardSI(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"],
    );
  }
}

//--------------mahasiswa----------------------------
class Mahasiswa{
  String id, nama, nim, alamat, email, foto, nim_progmob;

  Mahasiswa({this.id, this.nama, this.nim, this.alamat, this.email, this.foto, this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(
      id: map["id"],
      nama: map["nama"],
      nim: map["nim"],
      alamat: map["alamat"],
      email: map["email"],
      foto: map["foto"],
      nim_progmob: map["nim_progmob"],
    );
  }

  Map<String, dynamic> toJson(){
    return{"id":id, "nama":nama, "nim":nim, "alamat":alamat, "email":email, "foto":foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString(){
    return 'Mahasiswa{id":$id, nama:$nama, nim:$nim, alamat:$alamat, email:$email, foto:$foto, nim_progmob:$nim_progmob}';
  }
}

List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data= json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item)=> Mahasiswa.fromJson(item)));
}
String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//--------------------------------------dosen------------------------------------------
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({
    this.id, this.nama, this.nidn, this.alamat,
    this.email, this.gelar, this.foto, this.nim_progmob
  });

  factory Dosen.fromJson(Map<String, dynamic> map) {
    return Dosen(id: map["id"], nama: map["nama"], nidn: map["nidn"], alamat: map["alamat"],
        email: map["email"], gelar: map["gelar"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Dosen{id: $id, nama: $nama, nidn: $nidn, alamat: $alamat, email: $email, foto: $foto, nim_progmob: $nim_progmob}';
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


//---------------------------------------matkul------------------------------------------
class Matakuliah{
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Matakuliah({this.id, this.kode, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});

  //mapping dr json ke object
  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(
        id: map["id"],
        kode: map["kode"],
        nama: map["nama"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "kode": kode, "nama": nama, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Matkul{id: $id, kode: $kode, nama: $nama, hari: $hari, sesi: $sesi, sks: $sks, nim_progmob: $nim_progmob}';
  }
}

List<Matakuliah> matkulFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matkulToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//--------------------------------------USER---------------------------------------

class User {
  String id, nim, nama, password, nim_progmob;

  User({this.id, this.nim, this.password, this.nama, this.nim_progmob});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nim": nim,
      "nama": nama,
      "password": password,
      "nim_progmob": nim_progmob
    };
  }
  factory User.fromJson(Map<String, dynamic> map){
    return User(
        id: map["1"],
        nim: map["7216000"],//
        nama: map["7216000"],
        password: map["progmob"],//
        nim_progmob: map["nim_progmob"]);
  }
  @override
  String toString() {
    return 'User{id: $id, nim: $nim, nama: $nama, password: $password, nim_progmob: $nim_progmob}';
  }
}

List<User> userFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<User>.from(data.map((item) => User.fromJson(item)));
}

String userToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);

}
//--------------------------------------Jadwal---------------------------------------
class Jadwal{
  String id, id_matkul, id_dosen, nidn, hari, sesi, sks, nim_progmob;

  Jadwal({this.id, this.id_matkul, this.id_dosen, this.nidn, this.hari, this.sesi, this.sks, this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(
        id: map["id"],
        id_matkul: map["matkul"],
        id_dosen: map["dosen"],
        nidn: map["nidn"],
        hari: map["hari"],
        sks: map["sks"],
        sesi: map["sesi"],
        nim_progmob: map["nim_progmob"]);
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
