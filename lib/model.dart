import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//chart
class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
  : this.color = charts.Color(
    r: color.red,
    g: color.green,
    b: color.blue,
    a: color.alpha);
}

// dashboard
class DashboardTA{
  String mahasiswa;
  String dosen;
  String jadwal;
  String matkul;

  DashboardTA({this.mahasiswa, this.dosen, this.jadwal, this.matkul});

  factory DashboardTA.fromJson(Map<String, dynamic> json){
    return DashboardTA(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      jadwal: json["jadwal"],
      matkul: json["matkul"]
    );
  }
}

// daftar mahasiswa
class Mhs {
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mhs(
      {this.id, this.nama, this.nim, this.alamat, this.email, this.foto, this.nim_progmob});

  factory Mhs.fromJson(Map<String, dynamic>map){
    return Mhs(id: map['id'],
        nama: map["nama"],
        nim: map["nim"],
        alamat: map["alamat"],
        email: map["email"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "nim": nim,
      "alamat": alamat,
      "email": email,
      "foto": foto,
      "nim_progmob": nim_progmob
    };
  }

  @override
  String toString() {
    return 'mhs{id: $id, nama: $nama, nim: $nim, alamat: $alamat, email:$email, foto:$foto, nim_progmob:$nim_progmob}';
  }
}

List<Mhs> mhsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mhs>.from(data.map((item) => Mhs.fromJson(item)));
}

String mhsToJson(Mhs data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//daftar matkul
class Matkul{
  String id;
  String kode;
  String nama;
  int hari;
  int sesi;
  int sks;
  String nim_progmob;

  Matkul({
    this.id, this.kode, this.nama, this.hari,
    this.sesi, this.sks, this.nim_progmob
  });

  factory Matkul.fromJson(Map<String, dynamic> map) {
    return Matkul(id: map["id"], kode: map["kode"], nama: map["nama"], hari: map["hari"],
        sks: map["sks"], sesi: map["sesi"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id": id, "kode": kode, "nama": nama, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob
  };

  @override
  String toString() {
    return 'Matkul{id: $id, kode: $kode, nama: $nama, hari: $hari, sesi: $sesi, sks: $sks, nim_progmob: $nim_progmob}';
  }
}

List<Matkul> matkulFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Matkul>.from(data.map((item) => Matkul.fromJson(item)));
}

String matkulToJson(Matkul data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//daftar dosen
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
