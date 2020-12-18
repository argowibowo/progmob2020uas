import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:hello_world_flutter/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();
  //---------dashboard
  //------- mahasiswa
  Future<DashboardSI> getDashboard() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/72180216");
    if (response.statusCode == 200){
      return DashboardSI.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }
  //---------------- mahasiswa
  Future<List<Mahasiswa>> getMahasiswa() async{
    final response = await client.get("$baseUrl/api/progmob/mhs/72180216");
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
          "nim_progmob":"72180216"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //dosen
  Future<List<Dosen>> getDosen() async{
    final response = await client.get("$baseUrl/api/progmob/dosen/72180216");
    if(response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<Dosen>> getOneDosen(String nidn) async{
    final response = await client.get("$baseUrl/api/progmob/dosen/72180216/"+nidn);
    if (response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createDosenWithFoto(Dosen data, File file, String filename) async{
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
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> updateDosenWithFoto(Dosen data, File file, String nidn_cari) async {
    String isFotoUpdate = "0";

    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/dosen/updatewithfoto")
    );

    Map<String, String> headers={
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
  Future<bool> deleteDosen(String nidn) async{
    final response = await client.post(
        "$baseUrl/api/progmob/dosen/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "nidn": nidn,
          "nim_progmob": "72180216"
        })
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }
  //---------------------------Daftar matkul-----------------------------
  Future<List<Matkul>> getMatkul() async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72180216");
    if (response.statusCode == 200){
      return matkulFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<Matkul>> getOneMatkul(String kode) async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72180216/"+kode);
    if (response.statusCode == 200){
      return matkulFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createMatkul(Matkul data) async{
    final response = await client.post("$baseUrl/api/progmob/matkul/create",
        headers: {"content-type": "application/json"},
        body: matkulToJson(data)
    );
    if(response.statusCode ==200){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> updateMatkul(Matkul data, String kodecari) async {
    final response = await client.post("$baseUrl/api/progmob/matkul/update",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "nama": data.nama,
          "kode": data.kode,
          "hari": data.hari,
          "sesi": data.sesi,
          "sks": data.sks,
          "kode_cari": kodecari,
          "nim_progmob": data.nim_progmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteMatkul(String kode) async{
    final response = await client.post(
        "$baseUrl/api/progmob/matkul/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob":"72180216"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  //Jadwal
  // ----------- Jadwal
  Future<List<Jadwal>> getJadwal() async{
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180216");
    if (response.statusCode == 200){
      return jadwalFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<bool> createJadwal(String kode, String nidn, String nim_progmob) async {
    int idDosen, idMatkul;
    List<Matkul> matkul = await getOneMatkul(kode);
    developer.log("matkul : "+matkul.toString());
    if(matkul == null || matkul.length == 0) {
      return false;
    } else {
      idMatkul = int.parse(matkul[0].id);
    }
    List<Dosen> dosen = await getOneDosen(nidn);
    developer.log("dosen : "+dosen.toString());
    if(dosen == null || dosen.length == 0) {
      return false;
    } else {
      idDosen = int.parse(dosen[0].id);
    }
    developer.log("id matkul : "+idMatkul.toString());
    developer.log("id dosen : "+idDosen.toString());
    final response = await client.post("$baseUrl/api/progmob/jadwal/create",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "id_dosen": idDosen,
          "id_matkul": idMatkul,
          "nim_progmob": nim_progmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateJadwal(Jadwal data, String kodeMatkul, String idCari) async {
    int idDosen, idMatkul;
    List<Matkul> matkul = await getOneMatkul(kodeMatkul);
    developer.log("matkul : "+matkul.toString());
    if(matkul == null || matkul.length == 0) {
      return false;
    } else {
      idMatkul = int.parse(matkul[0].id);
    }
    List<Dosen> dosen = await getOneDosen(data.nidn);
    developer.log("dosen : "+dosen.toString());
    if(dosen == null || dosen.length == 0) {
      return false;
    } else {
      idDosen = int.parse(dosen[0].id);
    }
    final response = await client.post("$baseUrl/api/progmob/jadwal/update",
        headers: {"content-type": "application/json"},
        body: json.encode({
          "id": idCari,
          "id_dosen": idDosen,
          "id_matkul": idMatkul,
          "nim_progmob": data.nim_progmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteJadwal(String id) async{
    final response = await client.post(
        "$baseUrl/api/progmob/jadwal/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "id":id,
          "nim_progmob":"72180216"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}