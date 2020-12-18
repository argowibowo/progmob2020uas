import 'dart:convert';
import 'dart:io';

import 'package:flutter_progmob2020/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  Future<DashboardSI> getDashboard() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/72170163");
    if (response.statusCode == 200){
      return DashboardSI.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }
  //---------------- mahasiswa
  Future<List<Mahasiswa>> getMahasiswa() async{
    final response = await client.get("$baseUrl/api/progmob/mhs/72170163");
    if (response.statusCode == 200){
      return mahasiswaFromJson(response.body);
    }else{
      return null;
    }
  }
  // ini dipakai create nya seperti sebelum uts, untuk kasus yang tidak memerlukan upload file
  Future<bool> createMhs(Mahasiswa data) async{
    final response = await client.post("$baseUrl/api/progmob/mhs/create",
        headers: {"content-type": "application/json"},
        body: mahasiswaToJson(data)
    );
    if(response.statusCode ==200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async{
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
      "nim_progmob":data.nim_progmob,
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nimcari) async{
    String isfotoupdate = "0";
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
      isfotoupdate = "1";
    }

    request.fields.addAll({
      "nama":data.nama,
      "nim":data.nim,
      "alamat":data.alamat,
      "email":data.email,
      "nim_progmob":data.nim_progmob,
      "nim_cari":nimcari,
      "is_foto_update":isfotoupdate
    }
    );
    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> deleteMhs(String nim) async{
    final response = await client.post(
        "$baseUrl/api/progmob/mhs/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nim":nim,
          "nim_progmob":"72170163"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  // ------------ Matakuliah
  Future<List<MataKuliah>> getMatakuliah() async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72170163");
    if (response.statusCode == 200){
      return matakuliahFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<bool> createMtk(MataKuliah data) async{
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
  Future<bool> updateMtk(MataKuliah data, String kodecari) async {
    final response = await client.post("$baseUrl/api/progmob/matkul/create",
        headers: {"content-type": "application/json"},
        body: {
          "nama": data.nama,
          "kode": data.kode,
          "hari": data.hari,
          "sesi": data.sesi,
          "sks": data.sks,
          "kode_cari": kodecari,
          "nim_progmob": data.nim_progmob
        }
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
          "nim_progmob":"72170163"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}