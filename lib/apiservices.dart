import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  //---------dashboard------------------------------------------------
  //------- mahasiswa-------------------------------------------------
  Future<DashboardSI> getDashboard() async {
    final response = await client.get(
        "$baseUrl/api/progmob/dashboard/721600012");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  //---------------- mahasiswa------------------------------------------
  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/721600012");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  // ini dipakai create nya seperti sebelum uts, untuk kasus yang tidak memerlukan upload file
  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post("$baseUrl/api/progmob/mhs/create",
        headers: {"content-type": "application/json"},
        body: mahasiswaToJson(data)
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createMhsWithFoto(Mahasiswa data, File file,
      String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
    );

    Map<String, String> headers = {
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
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
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
        'POST',
        Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
    );
    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };
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
    }
    );
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
          "nim_progmob": "721600012"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //------------------------------------matakuliah--------------------------------
  Future<List<Matakuliah>> getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/721600012");
    if (response.statusCode == 200) {
      return matkulFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMatkul(Matakuliah data) async {
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/create",
        headers: {"content-type": "application/json"},
        body: matkulToJson(data)
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMatkul(Matakuliah data, String kode_cari) async {
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
  if (response.statusCode == 200) {
  return true;
  } else {
  return false;
  }
}

Future<bool> deleteMatkul(String kode) async {
  final response = await client.post(
      "$baseUrl/api/progmob/matkul/delete",
      headers: {"content-type": "application/json"},
      body: json.encode(<String, String>{
        "kode": kode,
        "nim_progmob": "721600012"
      })
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

//---------------------------------------dosen----------------------------------
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/721600012");
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createDosen(Dosen data) async {
    final response = await client.post("$baseUrl/api/progmob/dosen/create",
        headers: {"content-type": "application/json"},
        body: dosenToJson(data)
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createDosenWithFoto(Dosen data, File file,
      String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto")
    );

    Map<String, String> headers = {
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
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "gelar": data.gelar,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateDosenWithFoto(Dosen data, File file,
      String nidn_cari) async {
    String isFotoUpdate = "0";

    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );

    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };

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
      isFotoUpdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "gelar": data.gelar,
      "nim_progmob": data.nim_progmob,
      "nidn_cari": nidn_cari,
      "is_foto_update": isFotoUpdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteDosen(String nidn) async {
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: json.encode(<String, String>{
          "nidn": nidn,
          "nim_progmob": "721600012"
        })
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  //------------------------------jadwal----------------------------------------
  Future<List<Jadwal>> getJadwal() async{
    final response = await client.get("$baseUrl/api/progmob/jadwal/721600012");
    if(response.statusCode == 200){
      return jadwalFromJson(response.body);
    } else{
      return null;
    }
  }

  Future<bool> createJadwal(Jadwal data) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/create",
        headers: {"content-type": "application/json"},
        body: jadwalToJson(data)
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> updateJadwal(Jadwal data, String kode) async{
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/jadwal/update")
    );
    request.fields.addAll({
      "id_matkul": data.id_matkul,
      "id_dosen": data.id_dosen,
      "nidn": data.nidn,
      "hari":data.hari,
      "sesi":data.sesi,
      "sks":data.sks,
      "nim_progmob": data.nim_progmob,
      "kode": kode
    });
    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }
  Future<bool> deleteJadwal(String kode) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob": "721600012"
        })
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> UpdateJadwal(String id, String id_matkul, String id_dosen) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/update",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id": id,
          "id_dosen": id_dosen,
          "id_matkul": id_matkul,
          "nim_progmob": "721600012"
        })
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }
  Future<bool> DeleteJadwal(String kode) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id": kode,
          "nim_progmob": "721600012"
        })
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }
}
