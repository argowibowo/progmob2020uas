import 'dart:convert';
import 'dart:html';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;
  //----------------------------------------Chart-------------------------------------
  ClicksPerYear(this.year, this.clicks, Color color)
    : this.color = charts.Color(
    r: color.alpha, g:color.blue, b:color.green, a:color.red);

}

//-------------------------------------dasboard----------------------------------------

class DashboardSI {
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
        jadwal: json["jadwal"]
    );
  }
}

//------------------------------daftar mahasiswa------------------------------

class Mahasiswa {
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({this.id, this.nama, this.nim, this.alamat, this.email, this.foto,
    this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic> map) {
    return Mahasiswa(id: map["id"],
        nama: map["nama"],
        nim: map["nim"],
        alamat: map["alamat"],
        email: map["email"],
        foto: map["foto"],
        nim_progmob: map["nim_prgmob"]);
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
    return 'Mahasiswa{id: $id, nama: $nama, nim: $nim, alamat: $alamat, email: $email, foto: $foto, nim_progmob $nim_progmob}';
  }
}


List<Mahasiswa> mahasiswaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}

String mahasiswaToJason(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//-----daftar matakuloah----
class Matakuliah {
  String kodeMataKuliah;
  String hari;
  String sesi;
  String dosen;
  String nama;
  int jmlMhs;

  Matakuliah(
      {this.kodeMataKuliah, this.hari, this.sesi, this.dosen, this.nama, this.jmlMhs});

  factory Matakuliah.fromJson(Map<String, dynamic> map) {
    return Matakuliah(kodeMataKuliah: map["kodeMatakuliah"],
        hari: map["hari"],
        sesi: map["sesi"],
        dosen: map["dosen"],
        nama: map["nama"],
        jmlMhs: map["jmlMhs"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "kodeMatakuliah": kodeMataKuliah,
      "hari": hari,
      "sesi": sesi,
      "dosen": dosen,
      "nama": nama,
      "jmlMhs": jmlMhs
    };
  }

  String toString() {
    return 'Matakuliah{kodeMatakuliah: $kodeMataKuliah, hari: $hari, sesi: $sesi, dosem: $dosen, nama: $nama, jmlMhs: $jmlMhs}';
  }
}
List<Matakuliah> matakuliahFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matakuliahToJason(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
///---dosen--
class Dosen {
  String nama;
  String nik;
  String email;


  Dosen({this.nama, this.nik, this.email});

  factory Dosen.fromJson(Map<String, dynamic> map) {
    return Dosen(nama: map["nama"], nik: map["nik"], email: map["email"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"nama": nama, "nik": nik, "email": email};
  }

  String toString() {
    return 'Dosen{nama: $nama, nik: $nik, email: $email}';
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJason(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//-----jadwal---
class Jadwal {
  String namaMatkul;
  String sesi;
  String jamMasuk;
  String jamSelesai;

  Jadwal({this.namaMatkul, this.sesi, this.jamMasuk, this.jamSelesai});

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(namaMatkul: map["namaMatkul"],
        sesi: map["sesi"],
        jamMasuk: map["jamMasuk"],
        jamSelesai: map["jamSelesai"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "namaMatkul": namaMatkul,
      "sesi": sesi,
      "jamMasuk": jamMasuk,
      "jamSelesai": jamSelesai
    };
  }

  String toString() {
    return 'jadwal{namaMatkul: $namaMatkul, sesi: $sesi, jamMasuk: $jamMasuk, jamSelesai: $jamSelesai}';
  }
}
  List<Jadwal> jadwalFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
}

String jadwalToJason(Jadwal data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


