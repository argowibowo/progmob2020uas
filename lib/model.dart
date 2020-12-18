// Model untuk mapping datanya

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ------------------------------login----------------------------------
class LoginResult {
  String nimnik;
  String password;
  String nama;

  LoginResult({
    this.nimnik, this.password, this.nama
  });

  factory LoginResult.createLoginResult(Map<String, dynamic> map) {
    return LoginResult(
      nimnik: map['nimnik'],
      password: map['password'],
      nama: map['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"nimnik": nimnik, "password": password, "nama": nama};
  }

  @override
  String toString() {
    return 'Login{nimnik: $nimnik, password: $password, nama: $nama}';
  }

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      nimnik: json["nimnik"],
      password: json["password"],
      nama: json["nama"],
    );
  }
}

List<LoginResult> loginFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginResult>.from(data.map((item) => LoginResult.fromJson(item)));
}

String loginToJson(LoginResult data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// ------------------------------chart----------------------------------
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
    : this.color = charts.Color(
    r: color.red, g: color.green, b: color.blue, a: color.alpha
  );
}

// ------------------------------dashboard----------------------------------
class DashboardSI {
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;
  String nim_progmob;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal, this.nim_progmob});

  factory DashboardSI.fromJson(Map<String, dynamic> json) {
    return DashboardSI(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"],
      nim_progmob: json["nim_progmob"]
    );
  }
}

// ------------------------------mahasiswa------------------------------
class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  // Konstruktor
  Mahasiswa({
    this.id, this.nama, this.nim, this.alamat,
    this.email, this.foto, this.nim_progmob
  });

  // Mapping dari Json ke object kita
  // Map<String> -> fieldnya berupa string (tujuannya) dan dynamic karena tidak tahu isi dari JSON-nya apa
  factory Mahasiswa.fromJson(Map<String, dynamic> map) {
    return Mahasiswa(id: map["id"], nama: map["nama"], nim: map["nim"], alamat: map["alamat"],
    email: map["email"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nim": nim, "alamat": alamat, "email": email, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Mahasiswa{id: $id, nama: $nama, nim: $nim, alamat: $alamat, email: $email, foto: $foto, nim_progmob: $nim_progmob}';
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

// ------------------------------dosen------------------------------
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

// ------------------------------matakuliah------------------------------
class Matakuliah{
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Matakuliah({
    this.id, this.kode, this.nama, this.hari,
    this.sesi, this.sks, this.nim_progmob
  });

  factory Matakuliah.fromJson(Map<String, dynamic> map) {
    return Matakuliah(id: map["id"], kode: map["kode"], nama: map["nama"], hari: map["hari"],
        sks: map["sks"], sesi: map["sesi"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id": id, "kode": kode, "nama": nama, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob
  };

  @override
  String toString() {
    return 'Matakuliah{id: $id, kode: $kode, nama: $nama, hari: $hari, sesi: $sesi, sks: $sks, nim_progmob: $nim_progmob}';
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

// ------------------------------jadwal------------------------------
class Jadwal{
  String id; // <-- id jadwal
  String id_dosen;
  String id_matkul;
  String kode; // <-- kode matkul
  String nama_matkul;
  String nama_dosen;
  String nidn;
  String nim_progmob;
  String hari;
  String sesi;
  String sks;

  Jadwal({
    this.id, this.id_dosen, this.id_matkul, this.kode, this.nama_matkul, this.nama_dosen, this.nidn,
    this.nim_progmob, this.hari, this.sesi, this.sks
  });

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(
        id: map["id"],
        id_dosen: map["id_dosen"],
        id_matkul: map["id_matkul"],
        kode: map["kode"],
        nama_matkul: map["matkul"],
        nama_dosen: map["dosen"],
        nim_progmob: map["nim_progmob"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"]);
  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id": id, "id_dosen": id_dosen, "id_matkul": id_matkul, "kode": kode, "nama_matkul": nama_matkul, "nama_dosen": nama_dosen, "nim_progmob": nim_progmob,
    "hari": hari, "nama": sesi, "sesi": nim_progmob, "sks": sks
  };

  @override
  String toString() {
    return 'Jadwal{id: $id, id_dosen: $id_dosen, id_matkul: $id_matkul, kode: $kode, nama_matkul: $nama_matkul, nama_dosen: $nama_dosen, '
        'nim_progmob: $nim_progmob, kode: $kode, hari: $hari, sesi: $sesi, sks: $sks}';
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