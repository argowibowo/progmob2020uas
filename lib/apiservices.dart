import 'dart:convert';
import 'dart:io';
import 'package:flutter_progmob/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;


class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();


  //--dashboard
  Future<DashboardSI> getDashboard() async {
    final response = await client.get(
        "$baseUrl/api/progmob/dashboard/72180266");
    if (response.statusCode == 200) {
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  //--mahasiswa
  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180266");
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
      String fileName) async {
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
            filename: fileName
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
        body: jsonEncode(< String, String > {
      "nim": nim,
      "nim_progmob": "72180266"
    })
    );

    if (response.statusCode == 200) {
      return true;
    }else {
      return false;
    }
  }

 //--dosen
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180266");
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createDsn(Dosen data) async {
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

  Future<bool> createDsnWithFoto(Dosen data, File file,
      String fileName) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dsn/createwithfoto")
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
            filename: fileName
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

  Future<bool> updateDsnWithFoto(Dosen data, File file,
      String nidncari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dsn/updatewithfoto")
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
      "nidn": data.nidn,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob,
      "nidn_cari": nidncari,
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
        "$baseUrl/api/progmob/dsn/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(< String, String > {
          "nidn": nidn,
          "nim_progmob": "72180266"
        })
    );

    if (response.statusCode == 200) {
      return true;
    }else {
      return false;
    }
  }

//--matakuliah
  Future<List<Matakuliah>> getMatakuliah() async {
    final response = await client.get("$baseUrl/api/progmob/matakuliah/72180266");
    if (response.statusCode == 200) {
      return matakuliahFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createMatkul(Matakuliah data) async {
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

  Future<bool> createMatkulWithFoto(Matakuliah data, File file,
      String fileName) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matakuliah/createwithfoto")
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
            filename: fileName
        )
    );
    request.fields.addAll({
      "kodematakuliah": data.kodeMataKuliah,
      "hari": data.hari,
      "sesi": data.sesi,
      "dosen": data.dosen,
      //"jmlmhs": data.jmlMhs
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateMatkulWithFoto(Matakuliah data, File file,
      String kodematakuliahcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matakuliah/updatewithfoto")
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
      "kodematakuliah": data.kodeMataKuliah,
      "hari": data.hari,
      "sesi": data.sesi,
      "dosen": data.dosen,
      "nama": data.nama,
      "kodematakuliahcari": kodematakuliahcari,
      "is_foto_update": isfotoupdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMatkul(String kodeMataKuliah) async {
    final response = await client.post(
        "$baseUrl/api/progmob/matakuliah/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(< String, String > {
          "kodematakuliah": kodeMataKuliah,
          "nim_progmob": "72180266"
        })
    );

    if (response.statusCode == 200) {
      return true;
    }else {
      return false;
    }
  }


//--jadwal
  Future<List<Jadwal>> getJadwal() async {
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180266");
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
      body: jadwalToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createJadwalWithFoto(Jadwal data, File file,
      String fileName) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/jadwal/createwithfoto")
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
            filename: fileName
        )
    );
    request.fields.addAll({
      "idjadwal": data.idjadwal,
      "matkul": data.matkul,
      "dosen": data.dosen,
      "nidn": data.nidn,
      "hari": data.hari,
      //"sesi": data.sesi,

    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateJadwalWithFoto(Jadwal data, File file,
      String idjadwalcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/jadwal/updatewithfoto")
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
      "idjadwal": data.idjadwal,
      "matkul": data.matkul,
      "dosen": data.dosen,
      "nidn": data.nidn,
      "hari": data.hari,
      "idjadwalcari": idjadwalcari,
      "is_foto_update": isfotoupdate
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteJadwal(String idjadwal) async {
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(< String, String > {
          "idjadwal": idjadwal,
          //"nim_progmob": "72180266"
        })
    );

    if (response.statusCode == 200) {
      return true;
    }else {
      return false;
    }
  }
}