import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();
  //---------dashboard------------------------------------------------
  //------- mahasiswa-------------------------------------------------
  Future<ModelSi> getDashboard() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180237");
    if (response.statusCode == 200){
      return ModelSi.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }
  //---------------- mahasiswa------------------------------------------
  Future<List<Mahasiswa>> getMahasiswa() async{
    final response = await client.get("$baseUrl/api/progmob/mhs/72180237");
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
          "nim_progmob":"72180237"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
//---------------- dosen------------------------------------------Future<ModelSi> getDashboard() async{

  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180237");
    if(response.statusCode == 200){
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
      String nidncar) async {
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
      "nidn_cari": nidncar,
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
          "nim_progmob": ""
        })
    );

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  Future<List<Matakuliah>> getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/nim");
    if(response.statusCode == 200){
      return matakulihaFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createMatkul(Matakuliah data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/matkul/create",
      headers: {"content-type": "application/json"},
      body: matakuliahToJson(data),
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  Future<bool> updateMatkul(Matakuliah data, String kodecari) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/update")
    );

    request.fields.addAll({
      "nama": data.nama,
      "nim_progmob": data.nim_progmob,
      "kode": data.kodeMatakuliah,
      "hari": data.hari,
      "sesi": data.sesi,
      "sks": data.sks,
      "kode_cari": kodecari
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
          "nim_progmob":"72180237"
        })
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}