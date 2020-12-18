import 'dart:convert';
import 'dart:io';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client =Client();
//------------------------MHS-----------------------------------
  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180186");
    if(response.statusCode == 200){
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<dynamic> getdsh() async {
    var response = await client.get("$baseUrl/api/progmob/mhs/72180186");
    if(response.statusCode == 200){
      return dshFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createMhsWithFoto(Mahasiswa data, File file,String filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );
    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };
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
      "nama":data.nama,
      "nim":data.nim,
      "alamat":data.alamat,
      "email":data.email,
      "nim_progmob":data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nimcari) async{
    String isfotoupdate ="0";
    var request = http.MultipartRequest(
      'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
    );
    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };
    request.headers.addAll(headers);
    if(file != null){
      request.files.add(
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: file.path
        )
      );
      isfotoupdate="1";
    }
    request.fields.addAll({
      "nama":data.nama,
      "nim":data.nim,
      "alamat":data.alamat,
      "email":data.email,
      "nim_progmob":data.nim_progmob,
      "nim_cari":nimcari,
      "is_foto_update":isfotoupdate
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
        "nim":nim,
        "nim_progmob":"72180186"
      })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
//---------------------------dos------------------------------
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180186");
    if(response.statusCode == 200){
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createDosWithFoto(Dosen data, File file,String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto")
    );
    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };
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
      "nama":data.nama,
      "nidn":data.nidn,
      "alamat":data.alamat,
      "email":data.email,
      "gelar":data.gelar,
      "nim_progmob":data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateDosWithFoto(Dosen data, File file, String nidncari) async{
    String isfotoupdate ="0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );
    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };
    request.headers.addAll(headers);
    if(file != null){
      request.files.add(
          http.MultipartFile(
              "foto",
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path
          )
      );
      isfotoupdate="1";
    }
    request.fields.addAll({
      "nama":data.nama,
      "nidn":data.nidn,
      "alamat":data.alamat,
      "email":data.email,
      "gelar":data.gelar,
      "nim_progmob":data.nim_progmob,
      "nidn_cari":nidncari,
      "is_foto_update":isfotoupdate
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteDos(String nidn) async {
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nidn":nidn,
          "nim_progmob":"72180186"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
//-------------------------------mtk----------------------------
  }
  Future<List<Matakuliah>> getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180186");
    if(response.statusCode == 200){
      return matkulFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createMtk(Matakuliah data) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/create")
    );
    Map<String,String> headers={
      "content-type": "application/json"
    };
    request.headers.addAll(headers);
    request.fields.addAll({
      "nama":data.nama,
      "nim_progmob":data.nim_progmob,
      "kode":data.kode,
      "hari":data.hari,
      "sesi":data.sesi,
      "sks":data.sks
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateMtk(Matakuliah data,String kode_cari) async{
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/update")
    );
    Map<String,String> headers={
      "content-type": "application/json"
    };
    request.headers.addAll(headers);
    request.fields.addAll({
      "nama":data.nama,
      "nim_progmob":data.nim_progmob,
      "kode":data.kode,
      "hari":data.hari,
      "sesi":data.sesi,
      "sks":data.sks,
      "kode_cari":kode_cari
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteMtk(String kode) async {
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode":kode,
          "nim_progmob":"72180186"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
//------------------------jdwl--------------------------------
  Future<List<Jadwal>> getJadwal() async {
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180186");
    if(response.statusCode == 200){
      return jadwalFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createJadwal(String idDos,String idMtk) async {
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/create",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
        "id_dosen":idDos,
        "id_matkul":idMtk,
        "nim_progmob":"72180186"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateJadwal(String id,String id_dosen,String id_matkul) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/update",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id":id,
          "id_dosen":id_dosen,
          "id_matkul":id_matkul,
          "nim_progmob":"72180186"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }

  Future<bool> deleteJadwal(String kode) async {
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id":kode,
          "nim_progmob":"72180186"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
  //////////////////////////////////////////////
  Future<bool> login(String nimnik,String pass) async {
    final response = await client.post(
        "$baseUrl/api/progmob/login",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nimnik":nimnik,
          "password":pass
        })
    );
    if (response.body.length>3) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setInt("is_logged", 1);
      return true;
    } else {

      return false;
    }

  }
  //////////////////////////////////////

}
