import 'dart:convert';
import 'dart:io';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMahasiswa.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client(); //mendefinisikan client

  //--------------LOGIN--------------
  Future<bool> login(Login data) async {
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
  //-------------DASHBOARD------------
  Future<DashboardSI> getDashboard() async {
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180196");
    if(response.statusCode == 200){
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

//-----------Mahasiswa-----------
  //membuat fungsi-fungsi


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
  //-----------CREATE DOSEN--------------
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

//-------------DELETE DOSEN-------------
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

  //MATAKULIAH
  Future<Matakuliah> getDashboardMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180196");
    if(response.statusCode == 200){
      return Matakuliah.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Matakuliah>> getMatakuliah() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180196");
    if (response.statusCode == 200) {
      return matakuliahFromJson(response.body);
    } else {
      return null;
    }
  }
  //-----------CREATE MATKUL--------------
  Future<bool> createMatkul(Matakuliah data) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/create")
    );

    Map<String, String> headers= {
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);
    request.fields.addAll({
      "nama": data.nama,
      "nim_progmob" : data.nim_progmob,
      "kode" : data.kode,
      "hari" : data.hari,
      "sesi" : data.sesi,
      "sks" : data.sks,
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  //----------------UPDATE MATKUL-----------
  Future<bool> updateMatkul(Matakuliah data, String kodeCari) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/update")
    );

    Map<String, String> headers= {
      "Content-type" : "multipart/form-data"
    };

    request.headers.addAll(headers);
      request.fields.addAll({
        "nama": data.nama,
        "nim_progmob" : data.nim_progmob,
        "kode" : data.kode,
        "hari" : data.hari,
        "sesi" : data.sesi,
        "sks" : data.sks,
        "kode_cari" : kodeCari
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

//-------------DELETE MATKUL-------------
  Future<bool> deleteMatkul(String kode) async{
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String> {
          "kode" : kode,
          "nim_progmob" : "72180196"
        })
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }


  //JADWAL
  Future<List<Jadwal>> getJadwal() async {
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180196");
    if (response.statusCode == 200) {
      return jadwalFromJson(response.body);
    } else {
      return null;
    }
  }
  //-----------CREATE JADWAL--------------
  Future<bool> createJadwal(Jadwal data) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/jadwal/create")
    );

    Map<String, String> headers= {
      "Content-type": "multipart/form-data"
    };

    request.fields.addAll({
      "id_dosen": data.id_dosen,
      "id_matkul": data.id_matkul,
      "nim_progmob" : "72180196"
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  //----------------UPDATE JADWAL-----------
  Future<bool> updateJadwal(Jadwal data, String id) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/jadwal/update")
    );

    Map<String, String> headers= {
      "Content-type" : "multipart/form-data"
    };

    request.headers.addAll(headers);
    request.fields.addAll({
      "id_matkul" : data.id_matkul,
      "id_dosen" : data.id_dosen,
      "id" : id,
      "nim_progmob" : "72180196"
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

//-------------DELETE JADWAL-------------
  Future<bool> deleteJadwal(String id) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String> {
          "id": id,
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
