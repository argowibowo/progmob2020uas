import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//=====================================================================
//-------------------------------CHART----------------------------------
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha
  );
}

//=========================================================================
//-------------------------------DASHBOARD----------------------------------
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
        jadwal: json["jadwal"]
    );
  }
}

//========================================================
//----------------------LOGIN-----------------------------
class LoginProgmob{
  String id;
  String nimnik;
  String password;
  String nama;
  String email;
  String is_admin;

  //konstruktor
  LoginProgmob({this.id, this.nimnik, this.password, this.nama, this.email, this.is_admin});

  factory LoginProgmob.createLoginResult(Map<String, dynamic> map) {
    return LoginProgmob(
      id: map['id'],
      nimnik: map['nimnik'],
      password: map['password'],
    );
  }

  //mapping dr json ke object
  factory LoginProgmob.fromJson(Map<String, dynamic> map){
    return LoginProgmob(
      nimnik: map["nimnik"],
      password: map["password"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"nimnik": nimnik, "password": password};
  }

  @override
  String toString() {
    return 'LoginProgmob{nimnik: $nimnik, password: $password}';
  }
}

List<LoginProgmob> loginFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<LoginProgmob>.from(data.map((item) => LoginProgmob.fromJson(item)));
}

String loginToJson(LoginProgmob data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


//========================================================
//----------------------MAHASISWA--------------------------
class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  //konstruktor
  Mahasiswa({this.id, this.nama, this.nim, this.alamat, this.email,
    this.foto, this.nim_progmob});

  //mapping dr json ke object
  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(
      id: map["id"],
      nama: map["nama"],
      nim: map["nim"],
      alamat: map["alamat"],
      email: map["email"],
      foto: map["foto"],
      nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "nama": nama, "nim": nim, "alamat": alamat, "email": email, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Mahasiswa{id: $id, nama: $nama, nim: $nim, alamat: $alamat,email: $email, foto: $foto, nim_progmob: $nim_progmob}';
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

//=====================================================
//----------------------DOSEN--------------------------
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  //konstruktor
  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email,
    this.gelar, this.foto, this.nim_progmob});

  //mapping dr json ke object
  factory Dosen.fromJson(Map<String, dynamic> map){
    return Dosen(
        id: map["id"],
        nama: map["nama"],
        nidn: map["nidn"],
        alamat: map["alamat"],
        email: map["email"],
        gelar: map["gelar"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email, "gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Dosen{id: $id, nama: $nama, nidn: $nidn, alamat: $alamat,email: $email, gelar: $gelar, foto: $foto, nim_progmob: $nim_progmob}';
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//=========================================================
//----------------------MATAKULIAH--------------------------
class Matkul{
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  //konstruktor
  Matkul({this.id, this.kode, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});

  //mapping dr json ke object
  factory Matkul.fromJson(Map<String, dynamic> map){
    return Matkul(
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

List<Matkul> matkulFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matkul>.from(data.map((item) => Matkul.fromJson(item)));
}

String matkulToJson(Matkul data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//=====================================================
//----------------------JADWAL--------------------------
class Jadwal{
  String id; //ini id jadwal
  String id_matkul; //ini id matkul
  String id_dosen; //ini id dosen
  String matkul; //ini nama matkul
  String dosen; //ini nama dosen
  String nidn; //ini nidn dosen
  String hari; //ini hari matkul
  String sesi; //ini sesi matkul
  String sks; //ini sks matkul
  String nim_progmob;

  //konstruktor
  Jadwal({this.id, this.id_matkul, this.id_dosen, this.matkul, this.dosen, this.nidn, this.hari, this.sesi, this.sks, this.nim_progmob});

  //mapping dr json ke object
  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"],
        id_matkul: map["id_matkul"], //id nya dari tabel matkul utk ambil nama matkul, hari, sesi, sks
        id_dosen: map["id_dosen"], //id nya dari tabel dosen utk ambil nama dosen, nidn
        matkul: map["matkul"], //nama nya dari tabel matkul
        dosen: map["dosen"], //nama nya dari tabel dosen
        nidn: map["nidn"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "id_matkul": id_matkul, "id_dosen": id_dosen, "matkul": matkul, "dosen": dosen, "nidn": nidn, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Jadwal{id: $id, id_matkul: $id_matkul, id_dosen: $id_dosen, matkul: $matkul, dosen: $dosen, nidn: $nidn, hari: $hari, sesi: $sesi, sks: $sks, nim_progmob: $nim_progmob}';
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