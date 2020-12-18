import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/dashboard.dart';
import '';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https//argouchiha.000webhostapp.com";

  Client client = Client();

  //-------------------Dashboard---------------------//
  Future<DashboardSI> getDashboard() async {
    final response = await client.get("$baseUrl/api/dashboard/72180179");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  //-----------------Mahasiswa---------------//
  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180179");
    if (response.statusCode == 200) {
      return mahasiswaFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mahasiswa data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mahasiswa/createwithfoto",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: mahasiswaToJson(data),
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
        Url.porse("$baseUrl/api/progmob/mhs/createwithfoto")
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
        'POST',
        Url.parse("$baseUrl/api/progmob/mhs/updateithfoto")
    );

    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add{
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file, lenghtSync(),
            filename: file.path
        )
      };
      isfotoupdate = "1";
    }
  }

  Future<bool> deleteMhs(String nim) async {
    final response = await client.post(
        "$baseUrl/api/progmob/mhs/delete",
        headers: {"content-type": application / json},
        body: jsonEncode(<String, String>{
          "nim": nim,
          "nim_progmob": "72180179"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  //-----------------Dosen---------------//
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dos/72180179");
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createDos(Dosen data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/dosen/createwithfoto",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: dosenToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createDosWithFoto(Dosen data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Url.porse("$baseUrl/api/progmob/dos/createwithfoto")
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
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateDosWithFoto(Dosen data, File file, String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Url.parse("$baseUrl/api/progmob/dos/updateithfoto")
    );

    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add{
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file, lenghtSync(),
            filename: file.path
        )
      };
      isfotoupdate = "1";
    }
  }

  Future<bool> deleteDos(String nidn) async {
    final response = await client.post(
        "$baseUrl/api/progmob/dos/delete",
        headers: {"content-type": application / json},
        body: jsonEncode(<String, String>{
          "nidn": nidn,
          "nim_progmob": "72180179"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //-----------------Jadwal---------------//
  Future<List<Jadwal>> getJadwal() async {
    final response = await client.get("$baseUrl/api/progmob/jdwl/72180179");
    if (response.statusCode == 200) {
      return jadwalFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createJdwl(Jadwal data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/jadwal/createwithfoto",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: jadwalToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createJdwlWithFoto(Jadwal data, File file,
      String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Url.porse("$baseUrl/api/progmob/jdwl/createwithfoto")
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
      "hari": data.hari,
      "jam": data.jam,
      "ruangan": data.ruangan,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateJdwlWithFoto(Jadwal data, File file,
      String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Url.parse("$baseUrl/api/progmob/jdwl/updateithfoto")
    );

    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add{
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file, lenghtSync(),
            filename: file.path
        )
      };
      isfotoupdate = "1";
    }
  }

  Future<bool> deleteJadwal(String nim_progmob) async {
    final response = await client.post(
        "$baseUrl/api/progmob/jdwl/delete",
        headers: {"content-type": application / json},
        body: jsonEncode(<String, String>{
          "nim_progmob": "72180179"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //-----------------Mata Kuliah---------------//
  Future<List<Matakuliah>> getMatakuliah() async {
    final response = await client.get("$baseUrl/api/progmob/mk/72180179");
    if (response.statusCode == 200) {
      return matakuliahFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMk(Matakuliah data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/matakuliah/createwithfoto",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: matakuliahToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createMkWithFoto(Mahasiswa data, File file,
      String filename) async {
    var request = http.MultipartRequest(
        'POST',
        Url.porse("$baseUrl/api/progmob/mk/createwithfoto")
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
      "kode": data.kode,
      "sks": data.sks,
      "grup": data.grup,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMkWithFoto(Matakuliah data, File file,
      String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Url.parse("$baseUrl/api/progmob/mk/updateithfoto")
    );

    Map<String, String> headers = {
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);

    if (file != null) {
      request.files.add{
        http.MultipartFile(
            "foto",
            file.readAsBytes().asStream(),
            file, lenghtSync(),
            filename: file.path
        )
      };
      isfotoupdate = "1";
    }
  }
  Future<bool> deleteMk(String kode) async {
    final response = await client.post(
        "$baseUrl/api/progmob/mk/delete",
        headers: {"content-type": application / json},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob": "72180179"
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}