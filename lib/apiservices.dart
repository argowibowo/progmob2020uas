import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices{
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await client.get("$baseUrl/api/progmob/mhs/72180225");
    if(response.statusCode == 200){
      return mahasiswaFromJson(response.body);
    }else{
      return null;
    }
  }


  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
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
      "nim": data.nim,
      "alamat": data.alamat,
      "email": data.email,
      "nim_progmob": data.nim_progmob
    });

    var response = await request.send();
    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> updateMhsWithFoto(Mahasiswa data, File file,
      String nimcari) async {
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST', Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
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
        headers :{"content-type" : "application/json"},
        body : jsonEncode(<String, String>{
          "nim":nim,
          "nim_progmob": "72180225"
        })
    );

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  ///////////////DOSEN/////////////////
  Future<List<Dosen>> getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180225");
    if(response.statusCode == 200){
      return dosenFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<List<Dosen>> getOneDosen(String nidn) async {
    final response = await client.get(
        "$baseUrl/api/progmob/dosen/72180225/" + nidn);
    if (response.statusCode == 200) {
      return dosenFromJson(response.body);
    } else {
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
      String nidncari) async {
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
        "$baseUrl/api/progmob/dosen/delete",
        headers :{"content-type" : "application/json"},
        body : jsonEncode(<String, String>{
          "nidn":nidn,
          "nim_progmob": "72180225"
        })
    );

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
  /////////////////MATAKULIAH/////////////
  Future<List<Matkul>> getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180225");
    if(response.statusCode == 200){
      return matkulFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<Matkul>> getOneMatakuliah(String kode) async{
    final response = await client.get("$baseUrl/api/progmob/matkul/72180225/"+kode);
    if (response.statusCode == 200){
      return matkulFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createMatkul(Matkul data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/matkul/create",
      headers: {"content-type": "application/json"},
      body: matkulToJson(data),
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  Future<bool> updateMatkul(Matkul data, String kodecari) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/matkul/update")
    );

    request.fields.addAll({
      "nama": data.nama,
      "nim_progmob": data.nim_progmob,
      "kode": data.kode,
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
          "nim_progmob":"72180225"
        })
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  ////////////////////KRS////////////////////////
  Future<List<Krs>> getKrs() async {
    final response = await client.get("$baseUrl/api/progmob/krs/72180225");
    if(response.statusCode == 200){
      return krsFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> createKrs(Krs data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/krs/create",
      headers: {"content-type": "application/json"},
      body: krsToJson(data),
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  Future<bool> updateKrs(Krs data, String krscari) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/progmob/krs/update")
    );

    request.fields.addAll({
      "kode": data.kode,
      "nama_matkul": data.nama_matkul,
      "nidn": data.nidn,
      "dosen": data.dosen,
      "gelar": data.gelar,
      "hari": data.hari,
      "sesi": data.sesi,
      "sks": data.sks,
      "mhs": data.mhs,
      "nim": data.nim,
      "krs_cari": krscari
    });

    var response = await request.send();
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteKrs(String kode) async {
    final response = await client.post(
        "$baseUrl/api/progmob/krs/delete",
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "kode": kode,
          "nim_progmob": "72180225"
        })
    );
  }

    ////////////////////JADWAL////////////////////////
  Future<List<Jadwal>> getJadwal() async{
    final response = await client.get("$baseUrl/api/progmob/jadwal/72180225");
    if (response.statusCode == 200){
      return jadwalFromJson(response.body);
    }else{
      return null;
    }
  }
  Future<bool> createJadwal(String kode, String nidn, String nimProgmob) async {
    int idDosen, idMatkul;
    List<Matkul> matkul = await getOneMatakuliah(kode);
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
          "nim_progmob": nimProgmob
        })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> updateJdwl(Jadwal data, String kodeMatkul, String idCari) async {
    int idDosen, idMatkul;
    List<Matkul> matkul = await getOneMatakuliah(kodeMatkul);
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
          "nim_progmob":"72180225"
        })
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  ///////////////////LOGIN////////////////////////
  // Future<User> login(String nimnik,String password) async{
  //   String apiURL = "https://argouchiha.000webhostapp.com/api/progmob/login";
  //
  //   final response = await http.post(apiURL,
  //   headers: {"Accept": "Application/json"},
  //   body: {"nimnik": nimnik, "password":password});
  //
  //
  //   var convertedDataToJson = jsonDecode(response.body);
  //   return convertedDataToJson;
  // }
  Future<bool> login(User data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/login",
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );
    print(data);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }



}