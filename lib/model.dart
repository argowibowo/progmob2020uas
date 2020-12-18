
import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
///chart
//class ClicksPerYear {
// final String year;
//final int clicks;
//final charts.Color color;

//ClicksPerYear(this.year, this.clicks, Color color)
//:this.color = charts.Color(
//     r: color.red, g: color.green, b: color.blue, a: color.alpha);
//  )

//}

//----------dashboard
class DashboardSI{
  String mahasiswa;
  // String dosen;
  // String matakuliah;
  // String jadwal;

  DashboardSI({this.mahasiswa});

  factory DashboardSI.fromJson(Map<String, dynamic> json){
    return DashboardSI(
        mahasiswa: json["mahasiswa"] // tambahkan dosen matkul dan jadwal
    );
  }
}
//-----------daftar mahasiswa
class Mahasiswa{
  String id;
  String nama;
  String nim;
  String alamat;
  String email;
  String foto;
  String nim_progmob;

  Mahasiswa({this.id, this.nama, this.nim, this.alamat, this.email, this.foto, this.nim_progmob});
  factory Mahasiswa.fromJson(Map<String, dynamic> map){
    return Mahasiswa(id: map["id"], nama: map["nama"], nim: map["nim"], alamat: map["alamat"],
        email: map["email"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson(){
    return{"id": id, "nama": nama, "nim": nim, "alamat": alamat, "email": email, "foto": foto, "nim_progmob": nim_progmob};
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

//-------- dosen
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat,
    this.email, this.gelar, this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map){
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
  Map<String, dynamic> toJson(){
    return{"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email,
      "gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
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

//-------matkul
class Matkul{
  String id;
  String kode;
  String nama;
  int hari;
  int sesi;
  int sks;
  String nim_progmob;

  Matkul({this.id, this.kode, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});

  factory Matkul.fromJson(Map<String, dynamic> map){
    return Matkul(
        id: map["id"],
        kode: map["kode"],
        nama: map["nama"],
        hari: int.parse(map["hari"]),
        sesi: int.parse(map["sesi"]),
        sks: int.parse(map["sks"]),
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

//---------jadwal
class Jadwal{
  String id;
  String matkul;
  String dosen;
  String nidn;
  int hari;
  int sesi;
  int sks;
  String nim_progmob;

  Jadwal({this.id, this.matkul, this.dosen, this.nidn, this.hari,
    this.sesi, this.sks, this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"],
        matkul: map["matkul"],
        dosen: map["dosen"],
        nidn: map["nidn"],
        hari: int.parse(map["hari"]),
        sesi: int.parse(map["sesi"]),
        sks: int.parse(map["sks"]),
        nim_progmob: map["nim_progmob"]
    );
  }
  Map<String, dynamic> toJson(){
    return{"id":id, "matkul": matkul, "dosen": dosen, "nidn": nidn, "hari": hari,
      "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
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

//To Do
class ToDo{
  int userId;
  int id;
  String title;
  bool completed;

  ToDo({this.userId, this.id, this.title, this.completed});
}