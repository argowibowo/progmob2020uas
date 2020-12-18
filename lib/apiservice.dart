import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter_app/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();
  //------------------------------Dashboard-------------------------------------
  //---------------------------Mahasiswa----------------------------------------
  Future<DashboardSI> getDashboard() async {
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180217");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  //---------------------------Mahasiswa----------------------------------------
  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180217");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }
  /*Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
        "$baseUrl/api/progmob/mhs/create",
      headers :{"content-type" : "application/json"}
      body : mahasiswaToJson(data),
    );

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }*/

  Future<bool> createMhsWithFoto(Mahasiswa data, File file,
      String filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    request.headers.addAll(headers);
    request.files.add(
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: filename
        )
    );

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMhsWithFoto(Mahasiswa data, File file,
      String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    request.headers.addAll(headers);
    if (file != null) {
      request.files.add(
          http.MultipartFile(
              "foto",
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path
          )
      );
      isfotoupdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
      "nim_cari": nimcari,
      "is_foto_update": isfotoupdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMhs(String nim) async {
    final response = await client.post(
        "$baseUrl/api/progmob/mhs/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nim": nim,
          "nim_progmob": "72180217"
        })
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------Dosen----------------------------------------
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180217");
    if(response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<Dosen>> getOneDosen(String nidn) async{
    final response = await client.get("$baseUrl/api/progmob/dosen/72180217/"+nidn);
    if (response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createDsnWithFoto(Dosen data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto")
    );
    Map<String, String> headers={"Content-type" : "multipart/form-data"};

    request.headers.addAll(headers);
    request.files.add(
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: filename
        )
    );
    request.fields.addAll({
      "nama": data.nama,
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "gelar": data.gelar,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateDsnWithFoto(Dosen data, File file,
      String nidncari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    request.headers.addAll(headers);
    if (file != null) {
      request.files.add(
          http.MultipartFile(
              "foto",
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path
          )
      );
      isfotoupdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "gelar": data.gelar,
      "nim_progmob": data.nim_progmob,
      "nidn_cari": nidncari,
      "is_foto_update": isfotoupdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteDsn(String nidn) async {
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers :{"content-type" : "application/json"},
        body : jsonEncode(<String, String>{
          "nidn":nidn,
          "nim_progmob": "72180217"
        })
    );

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //---------------------------Matkul----------------------------------------
  Future<List<Matakuliah>> getMatakuliah() async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72180217");
    if (response.statusCode == 200){
      return matakuliahFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<List<Matakuliah>> getOneMatakuliah(String kode) async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72180217/"+kode);
    if (response.statusCode == 200){
      return matakuliahFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<bool> createMtk(Matakuliah data) async{
    final response = await client.post("$baseUrl/api/progmob/matkul/create",
        headers: {"content-type": "application/json"},
        body: matakuliahToJson(data)
    );
    if(response.statusCode ==200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> updateMtk(Matakuliah data, String kodecari) async {
    final response = await client.post("$baseUrl/api/progmob/matkul/update",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "nama": data.nama,
          "kode": data.kode,
          "hari": data.hari,
          "sesi": data.sesi,
          "sks": data.sks,
          "kode_cari": kodecari,
          "nim_progmob": data.nim_progmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteMtk(String kode) async{
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob":"72180217"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  // ----------- Jadwal
  Future<List<Jadwal>> getJadwal() async{
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180217");
    if (response.statusCode == 200){
      return jadwalFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<bool> createJadwal(String kode, String nidn, String nimProgmob) async {
    int idDosen, idMatkul;
    List<Matakuliah> matkul = await getOneMatakuliah(kode);
    developer.log("matkul : "+matkul.toString());
    if(matkul == null || matkul.length == 0) {
      return false;
    } else {
      idMatkul = int.parse(matkul[0].id);
    }
    List<Dosen> dosen = await getOneDosen(nidn);
    developer.log("dosen : "+dosen.toString());
    if(dosen == null || dosen.length == 0) {
      return false;
    } else {
      idDosen = int.parse(dosen[0].id);
    }
    developer.log("id matkul : "+idMatkul.toString());
    developer.log("id dosen : "+idDosen.toString());
    final response = await client.post("$baseUrl/api/progmob/jadwal/create",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "id_dosen": idDosen,
          "id_matkul": idMatkul,
          "nim_progmob": nimProgmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateJdwl(Jadwal data, String kodeMatkul, String idCari) async {
    int idDosen, idMatkul;
    List<Matakuliah> matkul = await getOneMatakuliah(kodeMatkul);
    developer.log("matkul : "+matkul.toString());
    if(matkul == null || matkul.length == 0) {
      return false;
    } else {
      idMatkul = int.parse(matkul[0].id);
    }
    List<Dosen> dosen = await getOneDosen(data.nidn);
    developer.log("dosen : "+dosen.toString());
    if(dosen == null || dosen.length == 0) {
      return false;
    } else {
      idDosen = int.parse(dosen[0].id);
    }
    final response = await client.post("$baseUrl/api/progmob/jadwal/update",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "id": idCari,
          "id_dosen": idDosen,
          "id_matkul": idMatkul,
          "nim_progmob": data.nim_progmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteJadwal(String id) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id":id,
          "nim_progmob":"72180217"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  /*Future<User> login(User requestModel) async {
    String url = "https://argouchiha.000webhostapp.com/api/progmob/login";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return User.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }*/
}