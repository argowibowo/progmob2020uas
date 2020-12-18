import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//--------------------------Chart----------------------------
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

//------------------------DashBoard-----------------------------
class DashboardSI {
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json) {
    return DashboardSI(
        mahasiswa: json["mahasiswa"],
        dosen: json["dosen"],
        matakuliah: json["matakuliah"],
        jadwal: json["jadwal"]);
  }
}

//------------------------DaftarMhs---------------------------------
class Mahasiswa {
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa(
      {this.id,
      this.nama,
      this.nim,
      this.alamat,
      this.email,
      this.foto,
      this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map) {
    return Mahasiswa(
        id: map["id"],
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
}

List<Mahasiswa> mahasiswaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}

String mahasiswaToJson(Mahasiswa data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//----------------Dosen---------------------
class Dosen {
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen(
      {this.id,
      this.nama,
      this.nidn,
      this.alamat,
      this.email,
      this.gelar,
      this.foto,
      this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map) {
    return Dosen(
        id: map["id"],
        nama: map["nama"],
        nidn: map["nidn"],
        alamat: map["alamat"],
        email: map["email"],
        gelar: map["gelar"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "nidn": nidn,
      "alamat": alamat,
      "email": email,
      "gelar": gelar,
      "foto": foto,
      "nim_progmob": nim_progmob
    };
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

//--------------------Matakuliah----------------------------
class Matakuliah {
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Matakuliah(
      {this.id,
      this.nama,
      this.kode,
      this.hari,
      this.sesi,
      this.sks,
      this.nim_progmob});

  factory Matakuliah.fromJson(Map<String, dynamic> map) {
    return Matakuliah(
        id: map["id"],
        nama: map["nama"],
        kode: map["kode"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "kode": kode,
      "hari": hari,
      "sesi": sesi,
      "sks": sks,
      "nim_progmob": nim_progmob
    };
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

//----------------Login---------------

class LoginRes {
  String id;
  String nama;
  String nimnik;
  String email;
  String password;
  String is_admin;

  LoginRes(
      {this.id,
        this.nama,
        this.nimnik,
        this.email,
        this.password,
        this.is_admin});

  factory LoginRes.createLoginResult(Map<String, dynamic> map) {
    return LoginRes(
      id: map['id'],
      nimnik: map['nimnik'],
      password: map['password'],
    );
  }

  factory LoginRes.fromJson(Map<String, dynamic> map) {
    return LoginRes(
        id: map["id"],
        nimnik: map["nimnik"],
        password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "nimnik": nimnik,
      "password": password
    };
  }
}

List<LoginRes> loginFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginRes>.from(data.map((item) => LoginRes.fromJson(item)));
}

String loginToJson(LoginRes data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// --------------------Jadwal---------------------
class Jadwal {
  String id;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  String sesi;
  String sks;
  String id_dosen;
  String id_matkul;
  String nim_progmob;

  Jadwal(
      {this.id,
        this.matkul,
        this.dosen,
        this.nidn,
        this.hari,
        this.sesi,
        this.sks,
        this.id_dosen,
        this.id_matkul,
        this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(
        id: map["id"],
        matkul: map["matkul"],
        dosen: map["dosen"],
        nidn: map["nidn"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
        id_dosen: map["id_dosen"],
        id_matkul: map["id_matkul"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "matkul": matkul,
      "dosen": dosen,
      "nidn": nidn,
      "hari": hari,
      "sesi": sesi,
      "sks": sks,
      "id_dosen": id_dosen,
      "id_matkul": id_matkul,
      "nim_progmob": nim_progmob
    };
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