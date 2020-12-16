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