import 'dart:convert';
import 'package:flutter/cupertino.dart';


//-----------------------charts------------------------------------
/*class ClicksPerYear{
  final String year;
  final int clicks;
  final charts.Color color;
  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}*/
//------------------------dashboard------------------------------------
class ModelSi{
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;

  ModelSi({this.mahasiswa, this.matakuliah, this.dosen, this.jadwal});

  factory ModelSi.fromJson(Map<String, dynamic> json) {
    return ModelSi(
      mahasiswa: json["mahasiswa"],
      dosen: json["dosen"],
      matakuliah: json["matakuliah"],
      jadwal: json["jadwal"]
    );
  }
}
//------------------------------mahasiswa----------------------------------
class Mahasiswa {

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
//---------------------------------------matakuliah----------------------------
class Matakuliah {

  String id;
  String kodeMatakuliah;
  String nama;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;
  Matakuliah({this.id,this.kodeMatakuliah, this.nama, this.hari, this.sesi, this.sks, this.nim_progmob});
  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(id:map["id"],kodeMatakuliah: map["kodeMatakuliah"], nama: map["kodeMatakuliah"], hari: map["hari"], sesi: map["sesi"], sks: map["sks"], nim_progmob: map["nim_progmob"]);
  }
  Map<String, dynamic> toJson(){
    return{"id":id,"kodeMatakuliah": kodeMatakuliah, "hari": hari, "sesi": sesi,"nim_progmob": nim_progmob};
  }
}
List<Matakuliah> matakulihaFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}
String matakuliahToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//-----------------------------------------dosen---------------------------------
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar,
    this.foto, this.nim_progmob});

  factory Dosen.fromJson(Map<String,dynamic>map){
    return Dosen(id: map["id"],nama: map["nama"],nidn: map["nidn"],alamat: map["alamat"],email: map["email"],gelar: map["gelar"],foto: map["foto"],nim_progmob: map["nim_progmob"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "nidn": nidn, "alamat": alamat, "email": email,"gelar": gelar, "foto": foto, "nim_progmob": nim_progmob};
  }
}

List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}
String DosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
//--------------------------Jadwal-------------------------------------------
class Jadwal{
  String id;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  String sesi;
  String sks;
  String nim_progmob;
  Jadwal({this.id, this.matkul, this.nidn, this.dosen,  this.hari, this.sesi, this.sks,  this.nim_progmob});

  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"], matkul: map["matkul"], nidn: map["nidn"],
        dosen: map["dosen"], hari: map["hari"], sesi: map["sesi"], sks: map["sks"], nim_progmob: map["nim_progmob"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"id": id, "matkul": matkul, "nidn": nidn, "dosen": dosen, "hari": hari, "sesi": sesi, "sks": sks, "nim_progmob": nim_progmob};
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

//--------------------------ToDo-------------------------------------------
/*class ToDo {
  int userId;
  int id;
  String title;
  bool completed;
  ToDo({this.userId, this.id, this.title, this.completed});
  factory ToDo.fromJson(Map<String, dynamic> map) {
    return ToDo(userId: map["userId"],
        id: map["id"],
        title: map["title"],
        completed: map["completed"]);
  }
  Map<String, dynamic> toJson {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
}
@override
String toString() {
  return 'ToDo{"userId": $userId, "id": $id, "tittle": $title, "completed": $completed}';
}
List<ToDo> todoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ToDo>.from(data.map((item) => ToDo.fromJson(item)));
}
String dosenToJson(ToDo data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
}*/