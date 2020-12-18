


import 'dart:convert';
class Login{
  String id;
  String nimnik;
  String password;
  String nama;
  String email;
  String is_admin;

  Login({
    this.id, this.nimnik, this.password, this.nama, this.email, this.is_admin
});

  factory Login.createLoginResult(Map<String, dynamic> map) {
    return Login(
      id: map['id'],
      nimnik: map['nimnik'],
      password: map['password'],
    );
  }
  factory Login.fromJson(Map<String, dynamic> map){
    return Login(
        nimnik: map["nimnik"],
        password: map["password"]
    );
  }

  Map<String, dynamic> toJson(){
    return{"nimnik": nimnik, "password": password};
  }

  @override
  String toString() {
    return 'Login{nimnik: $nimnik, password: $password}';
  }
}

List<Login> loginFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Login>.from(data.map((item) => Login.fromJson(item)));
}

String loginToJson(Login data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


class DashboardSI {
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;
  String nim_progmob;

  DashboardSI({
    this.mahasiswa,
    this.dosen,
    this.matakuliah,
    this.jadwal,
    this.nim_progmob});

  factory DashboardSI.fromJson(Map<String, dynamic>map){
    return DashboardSI(
        mahasiswa: map["mahasiswa"],
        dosen: map["dosen"],
        matakuliah: map["matakuliah"],
        jadwal: map["jadwal"],
        nim_progmob: map["nim_progmob"]

    );
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
List<DashboardSI> dashboardSIFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<DashboardSI>.from(data.map((item) => DashboardSI.fromJson(item)));
}

String dashboardSIToJson(DashboardSI data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

//----------MAHASISWA------------
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
  String kode;
  String hari;
  String sesi;
  String dosen;
  String nama;
  String sks;
  String nim_progmob;
  int jmlMhs;

  Matakuliah({this.kode, this.hari, this.sesi, this.dosen,this.jmlMhs, this.nama, this.nim_progmob, this.sks});

  factory Matakuliah.fromJson(Map<String, dynamic> map){
    return Matakuliah(
        kode: map["kode"],
        hari: map["hari"],
        sesi: map["sesi"],
        dosen: map["dosen"],
        jmlMhs: map["jmlMhs"],
        nama: map["nama"],
        nim_progmob: map["nim_progmob"],
        sks : map["sks"]);
  }

  Map<String, dynamic> toJson(){
    return{
      "kode" : kode,
      "hari" : hari,
      "sesi" : sesi,
      "dosen" : dosen,
      "jmlMhs" : jmlMhs,
      "nama" : nama,
      "nim_progmob" : nim_progmob,
      "sks" : sks
    };
  }
}
List<Matakuliah> matakuliahFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Matakuliah>.from(data.map((item) => Matakuliah.fromJson(item)));
}

String matakuliahToJson(Matakuliah data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
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
class Jadwal{
  String id;
  String id_dosen;
  String dosen;
  String nidn;
  String matkul;
  String hari;
  String sesi;
  String sks;
  String id_matkul;
  String nim_progmob;

  Jadwal({this.id, this.id_dosen, this.nidn, this.id_matkul, this.dosen, this.matkul, this.hari, this.sesi, this.sks, this.nim_progmob});


  factory Jadwal.fromJson(Map<String, dynamic> map){
    return Jadwal(
        id: map["id"],
        id_matkul: map["id_matkul"],
        id_dosen: map["id_dosen"],
        nim_progmob: map["nim_progmob"],
        dosen: map["dosen"],
        nidn: map["nidn"],
        matkul: map["matkul"],
        hari: map["hari"],
        sesi: map["sesi"],
        sks : map["sks"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "id_matkul": id_matkul,
      "id_dosen": id_dosen,
      "nim_progmob": nim_progmob,
      "dosen": dosen,
      "nidn" : nidn,
      "matkul": matkul,
      "hari": hari,
      "sesi": sesi,
      "sks": sks

    };
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

