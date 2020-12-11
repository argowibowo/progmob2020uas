
//----------MAHASISWA------------
import 'dart:convert';

class Mahasiswa {
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
    this.nim_progmob});

  factory Mahasiswa.fromJson(Map<String, dynamic>map){
    return Mahasiswa(
        id: map["id"],
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
}
 List<Mahasiswa> mahasiswaFromJson(String jsonData){
   final data = json.decode(jsonData);
   return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
 }

 String mahasiswaToJson(Mahasiswa data){
   final jsonData = data.toJson();
   return json.encode(jsonData);
 }


//----------Matakuliah--------
class Matakuliah{
  String kodeMatakuliah;
  String hari;
  String sesi;
  String dosen;
  String nama;
  int jmlMhs;

  Matakuliah({this.kodeMatakuliah, this.hari, this.sesi, this.dosen,this.jmlMhs, this.nama});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(
        kodeMatakuliah: map["kodeMatakuliah"],
        hari: map["hari"],
        sesi: map["sesi"],
        dosen: map["dosen"],
        jmlMhs: map["jmlMhs"],
        nama: map["nama"]);
  }

  Map<String, dynamic> toJson(){
    return{
      "kodeMatakuliah" : kodeMatakuliah,
      "hari" : hari,
      "sesi" : sesi,
      "dosen" : dosen,
      "jmlMhs" : jmlMhs,
      "nama" : nama
    };
  }
  List<Matakuliah> matakuliahFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
  }

  String matakuliahToJsonn(Matakuliah data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}

//---------Dosen-------------
class Dosen{
  String id;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;
  String foto;
  String nim_progmob;

  Dosen({this.id, this.nama, this.nidn, this.alamat, this.email, this.gelar, this.foto, this.nim_progmob});


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
}
List<Dosen> dosenFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String dosenToJson(Dosen data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//---------Jadwal----------


