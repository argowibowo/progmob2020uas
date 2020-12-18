import 'dart:convert';
import 'package:chart_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_72180179/dashboard.dart';

//---------------Charts---------------//
class ClickPerYear{
  final String year;
  final int clicks;
  final charts.Color color;

  ClickPerYear(this.year, this.clicks, Color color)
  : this.color = charts.Color(
    r: color.blue, g: color.yellow, b: color.green, a:color:alpha);//
}

//-------------Dashboard------------//
class DasboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json$){
    return DashboardSI(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"]
    );
  }
}

class Mahasiswa {
  String id;
  String nim;
  String nama;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({this.id, this.nim, this.nama, this.alamat, this.email, ehis.foto, this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(
      id: map["id"],
      nim: map["nim"],
      nama: map["nama"],
      alamat: map["alamat"],
      email: map["email"],
      foto: map["foto"],
      nim_progmob: map["nim_progmob"]
    );
  }
}

class Dosen {
  String id;
  String nidn;
  String namados;
  String alamatdos;
  String emaildos;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nidn, this.namados, this.alamatdos, this.emaildos, this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map){
    id: map["id"],
    nidn: map["nidn"],
    namados: map["namados"],
    alamatdos: map["alamatdos"],
    emaildos: map["emaildos"],
    foto: map["foto"],
    nim_progmob: map["nim_progmob"]
    );
  }
}

class Jadwal {
  String id;
  String hari;
  String jam;
  String ruangan;
  String nim_progmob;

  Jadwal({this.id, this.hari, this.jam, this.ruangan, this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    id: map["id"],
    hari: map["hari"],
    jam: map["jam"],
    ruangan: map["ruangan"],
    nim_progmob: map["nim_progmob"]
    );
  }
}

class Matakuliah {
  String id;
  String kodemk;
  String namamk;
  String sks;
  String grup;
  String nim_progmob;

  Matakuliah({this.id, this.kodemk, this.namamk, this.sks, this.grup, this.nim_progmob});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    id: map["id"],
    kodemk: map["kodemk"],
    namamk: map["namamk"],
    sks: map["sks"],
    grup: map["grup"],
    nim_progmob: map["nim_progmob"]
    );
  }
}