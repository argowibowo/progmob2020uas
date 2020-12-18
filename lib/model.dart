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
  String dosen;
  String matakuliah;
  // String jadwal;

  DashboardSI({this.mahasiswa, this.dosen});

  factory DashboardSI.fromJson(Map<String, dynamic> json){
    return DashboardSI(
        mahasiswa: json["mahasiswa"],
        dosen: json["dosen"]
      // tambahkan dosen matkul dan jadwal
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
//-------------------------------------------------Dosen-----------------------------------
class Dosen{
  int id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar, this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String, dynamic> map){
    return Dosen(id: map["id"], nama: map["name"], nidn: map["nidn"], alamat: map["alamat"], email: map["email"],
        gelar: map["gelar"], foto: map["foto"], nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email, "gelar": gelar, "foto": foto,
      "nim_progmob": nim_progmob};
  }
}
List<Dosen> dosenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
///-----------------------------------------Matkul=-----------------------------------
class Matakuliah{
  String namaMatkul;
  String namaDosen;
  String grup;
  String sks;
  String foto;
  String nim_progmob;

  Matakuliah({this.namaMatkul, this.namaDosen, this.grup, this.sks, this.foto, this.nim_progmob});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(namaMatkul: map["name"], namaDosen: map["namaDosen"], grup: map["grup"], sks: map["sks"],
        nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson(){
    return{"namaMatkul": namaMatkul, "namaDosen": namaDosen, "grup": grup, "sks": sks, "foto": foto, "nim_progmob": nim_progmob};
  }
}
List<Matakuliah> matakuliahFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matakuliahToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}