import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


//-------------------------------chart----------------------------
class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a:color.alpha
  );
}
//----------------------------dashboard------------------------------
class DashboardSI{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  DashboardSI({
    this.mahasiswa,
    this.dosen,
    this.matakuliah,
    this.jadwal});

  factory DashboardSI.fromJson(Map<String, dynamic> json){
    return DashboardSI(
        mahasiswa: json["mahasiswa"],
        dosen: json["dosen"],
        matakuliah: json["matakuliah"],
        jadwal: json["jadwal"]
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

  Mahasiswa({
    this.id,
    this.nama,
    this.nim,
    this.alamat,
    this.email,
    this.foto,
    this.nim_progmob
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(id: map["id"],
        nama: map["nama"],
        nim : map["nim"],
        alamat: map["alamat"],
        email: map["email"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id":id,"nama":nama,"nim":nim,"alamat":alamat,"email":email,"foto":foto,"nim_prgmob":nim_progmob};
  }

  @override
  String toString(){
    return 'Dosen{id:$id,nama:$nama,nim:$nim,alamat:$alamat,email:$email,foto:$foto,nim_progmob:$nim_progmob}';
  }
}
List<Mahasiswa> mahasiswaFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item)=>Mahasiswa.fromJson(item)));
}

String mahasiswaToJson(Mahasiswa data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//-------------------------daftar mata kuliah----------------------
class MataKuliah{
  String kodeMataKuliah;
  String hari;
  String sesi;
  String dosen;
  String nama;
  int jmlMhs;
  String nim_progmob;
  MataKuliah({
  this.kodeMataKuliah,
  this.hari,
  this.sesi,
  this.dosen,
  this.nama,
  this.jmlMhs,
  this.nim_progmob
  });

  factory MataKuliah.fromJson(Map<String, dynamic> map){
    return MataKuliah(kodeMataKuliah: map["kodeMataKuliah"],
        hari : map["hari"],
        sesi: map["sesi"],
        dosen: map["dosen"],
        nama: map["nama"],
        jmlMhs :map["jmlMhs"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"kodeMataKuliah":kodeMataKuliah,"nama":nama,"hari":hari,"sesi":sesi,"dosen":dosen,"jmlMhs":jmlMhs,"nim_prgmob":nim_progmob};
  }

  @override
  String toString(){
    return 'MataKuliah{kodeMataKuliah:$kodeMataKuliah,nama:$nama,hari:$hari,sesi:$sesi,dosen:$dosen,jmlMhs:$jmlMhs,nim_progmob:$nim_progmob}';
  }
}

List<MataKuliah> mataKuliahFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MataKuliah>.from(data.map((item)=>MataKuliah.fromJson(item)));
}

String mataKuliahToJson(MataKuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//-------------------------daftar dosen----------------------------
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
    this.id,
    this.nama,
    this.nidn,
    this.alamat,
    this.email,
    this.gelar,
    this.foto,
    this.nim_progmob
  });

  factory Dosen.fromJson(Map<String, dynamic> map){
    return Dosen(id: map["id"],
        nama: map["nama"],
        nidn : map["nidn"],
        alamat: map["alamat"],
        email: map["email"],
        gelar: map["gelar"],
        foto: map["foto"],
        nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id":id,"nama":nama,"nidn":nidn,"alamat":alamat,"email":email,"gelar":gelar,"foto":foto,"nim_prgmob":nim_progmob};
  }

  @override
  String toString(){
    return 'Dosen{id:$id,nama:$nama,nidn:$nidn,alamat:$alamat,email:$email,gelar:$gelar,foto:$foto,nim_progmob:$nim_progmob}';
  }
}
List<Dosen> dosenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item)=>Dosen.fromJson(item)));
}

String dosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//---------------------------To Do---------------------------------
class ToDo{
  int userId;
  int id;
  String title;
  bool completed;

  ToDo({this.userId, this.id, this.title, this.completed});
}
