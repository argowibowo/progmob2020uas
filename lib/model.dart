import 'dart:convert';
import 'package:flutter/material.dart';

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