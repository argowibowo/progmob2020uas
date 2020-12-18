import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//---chart
class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
    : this.color = charts.Color(
    r: color.red, g: color.green, b:color.blue, a:color.alpha);
}
//--dashboard
class DashboardSI{
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

//--daftar mahasiswa
class Mahasiswa{
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
    return Mahasiswa(id: map["id"], nama: map["nama"], nim: map["nim"], alamat: map["alamat"], email: map["email"], foto: map["foto"],
        nim_progmob: map["nim_progmob"]);
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
//daftar matakuliah
class Matakuliah {
  String kodeMataKuliah;
  String hari;
  String sesi;
  String dosen;
  String nama;
  int jmlMhs;
  String nim_progmob;
  String foto;

  Matakuliah({this.kodeMataKuliah, this.hari, this.sesi, this.dosen, this.nama,
      this.jmlMhs, this.nim_progmob, this.foto});

  factory Matakuliah.fromJson(Map<String, dynamic> map) {
    return Matakuliah(kodeMataKuliah: map["kodematakuliah"], hari: map["hari"], sesi: map["sesi"], dosen: map["dosen"], nama: map["nama"], jmlMhs: map["jmlmhs"], nim_progmob: map["nim_progmob"], foto: map["foto"]);
  }

  Map<String, dynamic> toJson() {
    return {"kodematakuliah": kodeMataKuliah, "hari": hari, "sesi": sesi, "dosen": dosen, "nama": nama, "jmlmhs": jmlMhs, "nim_progmob": nim_progmob, "foto": foto};
  }

  @override
  String toString() {
    return 'Matakuliah{kodematakuliah: $kodeMataKuliah, hari: $hari, sesi: $sesi, dosen: $dosen, nama: $nama, jmlmhs: $jmlMhs, nim_progmob: $nim_progmob, foto: $foto}';
  }
}
List<Matakuliah> matakuliahFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matakuliahToJson(Matakuliah data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//daftar dosen
class Dosen{
  int id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar,
      this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map) {
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
    return {"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email,
    "gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Dosen{id: $id, nama: $nama, nidn: $nidn, alamat: $alamat, email: $email, gelar: $gelar, foto: $foto, nim_progmob: $nim_progmob}';
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//daftar jadwal
class Jadwal {
  String idjadwal;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  int sesi;
  String foto;
  String nim_progmob;

  Jadwal({this.idjadwal, this.matkul, this.dosen, this.nidn, this.hari,
    this.sesi, this.foto, this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map) {
    return Jadwal(idjadwal: map["idjadwal"], matkul: map["matkul"], dosen: map["dosen"], nidn: map["nidn"], hari: map["hari"], sesi: map["sesi"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"idjadwal": idjadwal, "matkul": matkul, "dosen": dosen, "nidn": nidn, "hari": hari, "sesi": sesi, "foto": foto, "nim_progmob": nim_progmob};
  }

  @override
  String toString() {
    return 'Jadwal{idjadwal: $idjadwal, matkul: $matkul, dosen: $dosen, nidn: $nidn, hari: $hari, sesi: $sesi, foto: $foto, nim_progmob, $nim_progmob}';
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

//--- to do --

class ToDo{
  int userId;
  int id;
  String title;
  bool completed;

  ToDo({this.userId, this.id, this.title, this.completed});

  factory ToDo.fromJson(Map<String, dynamic> map){
    return ToDo(userId: map["userId"], id: map["id"], title: map["title"], completed: map["completed"]);
  }
}

