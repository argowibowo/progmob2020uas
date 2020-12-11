import 'dart:convert';
import 'dart:io';
import 'package:flutter_72180200/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  //============================================================
  //--------------------MAHASISWA-------------------------------
  Future<List<Mahasiswa>> getMahasiswas() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180200");
    if(response.statusCode == 200){
      return mahasiswaFromJson(response.body);
    }else{
      return null;
    }
  }

  //Ini buat yang create mhs tanpa foto (spt sblm uts)
  //Ini untuk kasus insert data TANPA UPLOAD FILE
  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mhs/create",
      headers: {"content-type": "application/json"},
      body: mahasiswaToJson(data),
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //Ini buat yang create mhs with dengan foto (utk yang skrg dipakai)
  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);

    //foto sbg key yg dibaca api
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
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nim_cari) async {
    String is_foto_update = "0"; //<--biar bisa tahu foto diupdate atau tidak, klo file kosong brti gk update foto
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);

    //kalau ada filenya, maka file akan ditambahkan dan isfotoupdate diubah jadi 1 dari yg tadinya 0
    if(file != null){
      request.files.add(
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: file.path
        )
      );
      is_foto_update = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
      "nim_cari": nim_cari,
      "is_foto_update": is_foto_update
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteMhs(String nim) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mhs/delete",
      headers: {"content-type": "application/json"},
      body: jsonEncode(<String, String>{
        "nim": nim,
        "nim_progmob":"72180200"
      })
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //=====================================================
  //------------------DOSEN------------------------------
  Future<List<Dosen>> getDosens() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180200");
    if(response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }

  //Ini buat yang create mhs tanpa foto (spt sblm uts)
  //Ini untuk kasus insert data TANPA UPLOAD FILE
  Future<bool> createDsn(Dosen data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/dosen/create",
      headers: {"content-type": "application/json"},
      body: dosenToJson(data),
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //Ini buat yang create mhs with dengan foto (utk yang skrg dipakai)
  Future<bool> createDsnWithFoto(Dosen data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);

    //foto sbg key yg dibaca api
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
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateDsnWithFoto(Dosen data, File file, String nidn_cari) async {
    String is_foto_update = "0"; //<--biar bisa tahu foto diupdate atau tidak, klo file kosong brti gk update foto
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );

    Map<String,String> headers={
      "Content-type":"multipart/form-data"
    };

    request.headers.addAll(headers);

    //kalau ada filenya, maka file akan ditambahkan dan isfotoupdate diubah jadi 1 dari yg tadinya 0
    if(file != null){
      request.files.add(
          http.MultipartFile(
              "foto",
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path
          )
      );
      is_foto_update = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "gelar": data.gelar,
      "nim_progmob": data.nim_progmob,
      "nidn_cari": nidn_cari,
      "is_foto_update": is_foto_update
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteDsn(String nidn) async {
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nidn": nidn,
          "nim_progmob":"72180200"
        })
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //=====================================================
  //------------------MATAKULIAH------------------------------
  Future<List<Matkul>> getMatkuls() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180200");
    if(response.statusCode == 200){
      return matkulFromJson(response.body);
    }else{
      return null;
    }
  }

  //Ini buat yang create mhs tanpa foto (spt sblm uts)
  //Ini untuk kasus insert data TANPA UPLOAD FILE
  Future<bool> createMatkul(Matkul data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/matkul/create",
      headers: {"content-type": "application/json"},
      body: matkulToJson(data),
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateMatkul(Matkul data, String kode_cari) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob/matkul/update")
    );

    request.fields.addAll({
      "nama": data.nama,
      "nim_progmob": data.nim_progmob,
      "kode": data.kode,
      "hari": data.hari.toString(),
      "sesi": data.sesi.toString(),
      "sks": data.sks.toString(),
      "kode_cari": kode_cari
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteMatkul(String kode) async {
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob":"72180200"
        })
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }


  //=====================================================
  //------------------JADWAL------------------------------
}