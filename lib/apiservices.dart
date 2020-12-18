import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_1/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();
  //---------dashboard
  //------- mahasiswa
  Future<DashboardSI> getDashboard() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/721600012");
    if (response.statusCode == 200){
      return DashboardSI.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }
  //---------------- mahasiswa
  Future<List<Mahasiswa>> getMahasiswa() async{
    final response = await client.get("$baseUrl/api/progmob/mhs/721600012");
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
          "nim_progmob":"72180215"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
    //-----------------------------Dosen-------------------------------------
  Future<List<Dosen>> getDosen() async{
    final response = await client.get("$baseUrl/api/progmob/dosen/721600012");
    if (response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }
  // ini dipakai create nya seperti sebelum uts, untuk kasus yang tidak memerlukan upload file
  Future<bool> createDosen(Dosen data) async{
    final response = await client.post("$baseUrl/api/progmob/dosen/create",
        headers: {"content-type": "application/json"},
        body: dosenToJson(data)
    );
    if(response.statusCode ==200){
      return true;
    }else{
      return false;
    }
  }
    Future<bool> createDosenWithFoto(Dosen data, File file, String filename) async{
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/api/progmob//createwithfoto")
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
       // "id":data.id,
        "nama":data.nama,
        "nidn":data.nidn,
        "alamat":data.alamat,
        "email":data.email,
        "gelar":data.gelar,
        "nim_progmob":data.nim_progmob,
      });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateDosenWithFoto(Dosen data, File file, String namacari) async{
    String isfotoupdate = "0";
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
      isfotoupdate = "1";
    }

    request.fields.addAll({
      //"id":data.id,
      "nama":data.nama,
      "nidn":data.nidn,
      "alamat":data.alamat,
      "email":data.email,
      "gelar":data.gelar,
      "foto":data.foto,
      "nim_progmob":data.nim_progmob,
      "nama_cari":namacari,
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

  Future<bool> deleteDosen(String nidn) async{
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nidn":nidn,
          "nim_progmob":"72180215"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //-----------------------Matakuliah=------------------------
  Future<List<Matakuliah>> getMatakuliah() async{
    final response = await client.get("$baseUrl/api/progmob/matakuliah/721600012");
    if (response.statusCode == 200){
      return matakuliahFromJson(response.body);
    }else{
      return null;
    }
  }
  // ini dipakai create nya seperti sebelum uts, untuk kasus yang tidak memerlukan upload file
  Future<bool> createMatakuliah(Matakuliah data) async{
    final response = await client.post("$baseUrl/api/progmob/matakuliah/create",
        headers: {"content-type": "application/json"},
        body: matakuliahToJson(data)
    );
    if(response.statusCode ==200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> createMatakuliahWithFoto(Matakuliah data, File file, String filename) async{
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob//createwithfoto")
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
      // "id":data.id,
      "namaMatkul":data.namaMatkul,
      "namaDosen":data.namaDosen,
      "grup":data.grup,
      "sks":data.sks,
      "nim_progmob":data.nim_progmob,
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateMatakuliahWithFoto(Matakuliah data, File file, String namacari) async{
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matakuliah/updatewithfoto")
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
      //"id":data.id,
      "namaMatkul":data.namaMatkul,
      "namaDosen":data.namaDosen,
      "grup":data.grup,
      "sks":data.sks,
      "foto":data.foto,
      "nim_progmob":data.nim_progmob,
      "nama_cari":namacari,
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

  Future<bool> deleteMatakuliah(String namaMatkul) async{
    final response = await client.post(
        "$baseUrl/api/progmob/matakuliah/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "namaMatkul":namaMatkul,
          "nim_progmob":"72180215"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }}