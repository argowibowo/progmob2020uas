import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

//-------------------------Dashboard------------------------------
  Future<DashboardSI> getDashboard() async {
    final response =
        await client.get("$baseUrl/api/progmob/dashboard/72180190");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

//-----------------------Get Data------------------------------

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180190");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180190");
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Matakuliah>> getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180190");
    if (response.statusCode == 200) {
      return matkulFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Jadwal>> getJadwal() async {
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180190");
    if (response.statusCode == 200) {
      return jadwalFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post("$baseUrl/api/progmob/mhs/create",
        headers: {"content-type": "application/json"},
        body: mahasiswaToJson(data));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

//----------------------- Create ------------------------------

  Future<bool> createMhsWithFoto(
      Mahasiswa data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.files.add(http.MultipartFile(
        "foto", file.readAsBytes().asStream(), file.lengthSync(),
        filename: filename));

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

  Future<bool> createDsnWithFoto(Dosen data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/dosen/createwithfoto"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.files.add(http.MultipartFile(
        "foto", file.readAsBytes().asStream(), file.lengthSync(),
        filename: filename));

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

  Future<bool> createMatkul(Matakuliah data) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/matkul/create"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.fields.addAll({
      "nama": data.nama,
      "kode": data.kode,
      "hari": data.hari,
      "sesi": data.sesi,
      "sks": data.sks,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createJadwal(Jadwal data) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/jadwal/create"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.fields.addAll({
      "id_dosen": data.id_dosen,
      "id_matkul": data.id_matkul,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //-------------------------- UPDATE -----------------------------

  Future<bool> updateMhsWithFoto(
      Mahasiswa data, File file, String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add(http.MultipartFile(
          "foto", file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path));
      isfotoupdate = "1";
    }

    request.fields.addAll({
      "nama": data.nama,
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
      "nim_cari": nimcari,
      "is_foto_update": isfotoupdate,
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateDsnWithFoto(Dosen data, File file, String nidncari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add(http.MultipartFile(
          "foto", file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path));
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
      "is_foto_update": isfotoupdate,
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMatkul(Matakuliah data, String kodecari) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/matkul/update"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.fields.addAll({
      "nama": data.nama,
      "kode": data.kode,
      "hari": data.hari,
      "sesi": data.sesi,
      "sks": data.sks,
      "nim_progmob": data.nim_progmob,
      "kode_cari": kodecari,
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateJadwal(Jadwal data, String id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/jadwal/update"));
    Map<String, String> headers = {"Content-type": "multipart/from-data"};

    request.headers.addAll(headers);

    request.fields.addAll({
      "id": data.id,
      "id_dosen": data.id_dosen,
      "id_matkul": data.id_matkul,
      "nim_progmob": data.nim_progmob,
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //-----------------------Delete------------------------------

  Future<bool> deleteMhs(String nim) async {
    final response = await client.post("$baseUrl/api/progmob/mhs/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(
            <String, String>{"nim": nim, "nim_progmob": "72180190"}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteDsn(String nidn) async {
    final response = await client.post("$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(
            <String, String>{"nidn": nidn, "nim_progmob": "72180190"}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMatkul(String kode) async {
    final response = await client.post("$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(
            <String, String>{"kode": kode, "nim_progmob": "72180190"}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteJadwal(String id) async {
    final response = await client.post("$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(
            <String, String>{"id": id, "nim_progmob": "72180190"}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //----------------------Login------------------------------
  Future<bool> login(LoginRes data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/login",
      headers: {"content-type": "application/json"},
      body: loginToJson(data),
    );

    if (response.body.length <= 2) {
      return false;
    } else {
      return true;
    }
  }
}
