import 'dart:convert';
import 'package:flutter/material.dart';

class Mahasiswa {
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa(
      {this.id, this.nama, this.nim, this.alamat, this.email, this.foto, this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(id: map["id"],
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

/*@override
  String toString() {
    return ''
  }*/
}
List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}

String mahasiswaToJson(Mahasiswa data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);

}
//--------------------------------------------dos---------------------------
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen(
      {this.id, this.nama, this.nidn, this.alamat, this.email,this.gelar, this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map){
    return Dosen(id: map["id"],
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

/*@override
  String toString() {
    return ''
  }*/
}
List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//--------------------------------mtk------------------------------
class Matakuliah{
  String id;
  String kode;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Matakuliah(
      {this.id, this.kode, this.nama, this.hari, this.sesi,this.sks, this.nim_progmob});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(id: map["id"],
        kode: map["kode"],
        nama: map["nama"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": kode,
      "nidn": nama,
      "hari": hari,
      "email": sesi,
      "gelar": sks,
      "nim_progmob": nim_progmob
    };
  }

/*@override
  String toString() {
    return ''
  }*/
}
List<Matakuliah> matkulFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matkulToJson(Matakuliah data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//-------------------------jdwl-----------------------------
class Jadwal{
  String id;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;

  Jadwal(
      {this.id, this.matkul, this.dosen, this.nidn, this.hari,this.sesi, this.sks,this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(id: map["id"],
        matkul: map["matkul"],
        dosen: map["dosen"],
        nidn: map["nidn"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks: map["sks"],
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
      "nim_progmob": nim_progmob
    };


/*@override
  String toString() {
    return ''
  }*/
}
}
List<Jadwal> jadwalFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
}

String jadwalToJson(Jadwal data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//-------------------------dsh----------------------
class dsh{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;
  String nim_progmob;

  dsh(
      {this.mahasiswa, this.dosen, this.matakuliah, this.jadwal, this.nim_progmob});

  factory dsh.fromJson(Map<String, dynamic> map){
    return dsh(
        mahasiswa: map["mahasiswa"],
        dosen: map["dosen"],
        matakuliah: map["matakuliah"],
        jadwal: map["jadwal"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "mahasiswa": mahasiswa,
      "dosen": dosen,
      "matakuliah": matakuliah,
      "jadwal": jadwal,
      "nim_progmob": nim_progmob
    };
  }
}
List<dsh> dshFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<dsh>.from(data.map((item) => dsh.fromJson(item)));
}

String dshToJson(Jadwal data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}