import 'dart:convert';
import 'dart:io';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMahasiswa.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client(); //mendefinisikan client


  //-------------DASHBOARD------------

//-----------Mahasiswa-----------
  //membuat fungsi-fungsi
Future<Mahasiswa> getDashboard() async {
  final response = await client.get("$baseUrl/api/progmob/dashboard/72180196");
  if(response.statusCode == 200){
    return Mahasiswa.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180196");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  //tanpa foto
  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mhs/create",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: mahasiswaToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //setelah uts pake yg ini
  //-----------CREATE MAHASISWA--------------
  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );

    Map<String, String> headers= {
      "Content-type": "multipart/form-data"
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
      "nama": data.nama,
      "nim" : data.nim,
      "alamat" : data.alamat,
      "email" : data.email,
      "nim_progmob" : data.nim_progmob
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  //----------------UPDATE MAHASISWA-----------
Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nimCari) async {
  String isFotoupdate = "0";
  var request = http.MultipartRequest(
    'POST',
    Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
  );

  Map<String, String> headers= {
    "Content-type" : "multipart/form-data"
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
    isFotoupdate = "1";
  }

  request.fields.addAll({
    "nama": data.nama,
    "nim" : data.nim,
    "alamat" : data.alamat,
    "email" : data.email,
    "nim_progmob" : data.nim_progmob,
    "nim_cari" : nimCari,
    "is_foto_update" : isFotoupdate
  });

  var response = await request.send();
  if(response.statusCode == 200){
    return true;
  } else {
    return false;
  }
}

//-------------DELETE MAHASISWA-------------
Future<bool> deleteMhs(String nim) async{
  final response = await client.post(
    "$baseUrl/api/progmob/mhs/delete",
    headers: {"content-type": "application/json"},
    body: jsonEncode(<String, String> {
      "nim" : nim,
      "nim_progmob" : "72180196"
    })
  );

  if(response.statusCode == 200){
    return true;
  } else {
    return false;
  }
}

  //-----------DOSEN-----------
  //membuat fungsi-fungsi
  Future<Dosen> getDashboardDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180196");
    if(response.statusCode == 200){
      return Dosen.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180196");
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }

  //tanpa foto
  Future<bool> createDsn(Dosen data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/dosen/create",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: dosenToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //setelah uts pake yg ini
  //-----------CREATE MAHASISWA--------------
  Future<bool> createDsnWithFoto(Dosen data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto")
    );

    Map<String, String> headers= {
      "Content-type": "multipart/form-data"
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
      "nama": data.nama,
      "nidn" : data.nidn,
      "alamat" : data.alamat,
      "email" : data.email,
      "gelar" : data.gelar,
      "nim_progmob" : data.nim_progmob
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  //----------------UPDATE DOSEN-----------
  Future<bool> updateDsnWithFoto(Dosen data, File file, String nidnCari) async {
    String isFotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );

    Map<String, String> headers= {
      "Content-type" : "multipart/form-data"
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
      isFotoupdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nidn" : data.nidn,
      "alamat" : data.alamat,
      "email" : data.email,
      "gelar" : data.gelar,
      "nim_progmob" : data.nim_progmob,
      "nidn_cari" : nidnCari,
      "is_foto_update" : isFotoupdate
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

//-------------DELETE MAHASISWA-------------
  Future<bool> deleteDsn(String nidn) async{
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String> {
          "nidn" : nidn,
          "nim_progmob" : "72180196"
        })
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}
