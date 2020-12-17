import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//----------------------------Chart--------------------------------
/*class CliksPerYaer{
  final String year;
  final String cliks;
  final charts.Color color;

  CliksPerYaer(this.year, this.cliks, charts.Color color)
      :this.color = charts.Color();
}*/
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

  @override
  String toString() {
    return 'Mahasiswa(id: $id, nama: $nama, nim: $alamat, email: $email, foto: $foto, nim_progmob: $nim_progmob)';
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