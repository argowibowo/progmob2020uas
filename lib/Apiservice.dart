import 'dart:convert';
import 'dart:html';

import 'dart:io';
import 'package:flutter_72170102/model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  Future<DashboardSI> getDashboard() async {
    final response = await client.get(
        "$baseUrl/api/progmob/dashboard/72170102");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

//Mahasiswa

  Future<List<Mahasiswa>> getMahasiswas() async {
    final response = await client.get(
        "$baseUrl/api/progmob/dashboard/72170102");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mhs/createwithfoto",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: mahasiswaToJason(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createMhsWithFoto(Mahasiswa data, file, filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );
    Map<String, String> headers = {
      "Content-type": "multipart/from-data"
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
      "nama" :data.nama,
      "nim" :data.nim,
      "alamat" :data.alamat,
      "email" :data.email,
      "nim_progmob" : data.nim_progmob

    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMhswithFoto(Mahasiswa data,  file, String nimcari) async{
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
      'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")

    );
    Map<String,String>headers={
      "Content-type":"multipart/from.data"
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
    });

    Future<bool>deleteMhs (int nama) async{
      final response = await client.delete(
        "$baseUrl/api/mhs/$nama",
        headers: {"content-type":"application/json"},
      );
      if (response.statusCode == 200){
        return true;
      }else{
        return false;
      }

    }
    //MDosen

    Future<List<Dosen>> getDosen() async {
      final response = await client.get(
          "$baseUrl/api/progmob/dashboard/72170102");
      if (response.statusCode == 200) {
        return dosenFromJson(response.body);
      } else {
        return null;
      }
    }
    Future<bool> createDosen(Dosen data) async {
      final response = await client.post(
        "$baseUrl/api/progmob/dosen/create",
        headers: {"content-type": "application/json; multipart/form-data"},
        body: dosenToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    Future<bool> updateDosen(Dosen data) async {
      final response = await client.put(
        "$baseUrl/api/dosen/${data.nama}",
        headers: {"content-type": "application/json"},
        body: dosenToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    Future<List<Matakuliah>> getMatakuliah() async {
      final response = await client.get(
          "$baseUrl/api/progmob/dashboard/72170102");
      if (response.statusCode == 200) {
        return matakuliahFromJson(response.body);
      } else {
        return null;
      }
    }
    Future<bool> createMatakuliah(Matakuliah data) async {
      final response = await client.post(
        "$baseUrl/api/progmob/matakuliah/createwithfoto",
        headers: {"content-type": "application/json; multipart/form-data"},
        body: matakuliahToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    Future<bool> updateMatakuliah(Matakuliah data) async {
      final response = await client.put(
        "$baseUrl/api/matakuliah/${data.kodeMataKuliah}",
        headers: {"content-type": "application/json"},
        body: matakuliahToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    Future<List<Jadwal>> getJadwal() async {
      final response = await client.get(
          "$baseUrl/api/progmob/dashboard/72170102");
      if (response.statusCode == 200) {
        return jadwalFromJson(response.body);
      } else {
        return null;
      }
    }
    Future<bool> createJadwal(Jadwal data) async {
      final response = await client.post(
        "$baseUrl/api/progmob/jadwal/createwithfoto",
        headers: {"content-type": "application/json; multipart/form-data"},
        body: jadwalToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    Future<bool> updateJadwal(Jadwal data) async {
      final response = await client.put(
        "$baseUrl/api/profile/${data.sesi}",
        headers: {"content-type": "application/json"},
        body: jadwalToJason(data),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }
}


