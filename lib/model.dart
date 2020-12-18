
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

//-------matkul
//---------jadwal
//-----todoo