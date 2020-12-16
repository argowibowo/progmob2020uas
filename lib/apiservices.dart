import 'dart:convert';
import 'dart:io';
import 'package:progmob_flutter_2020/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  // dashboard
  // mahasiswa
   Future<DashboardTA> getDashboard() async{
     final response = await client.get("$baseUrl/api/progmob/dashboard/72180184");
     if (response.statusCode == 200){
       return DashboardTA.fromJson(json.decode(response.body));
     } else {
       return null;
     }
   }

   //mahasiswa
  Future <List<Mhs>> getMhss() async{
    final response = await client.get("$baseUrl/api/progmob/mhs/72180184");
    if (response.statusCode == 200){
      return mhsFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mhs data) async {
     final response = await client.post(
       "$baseUrl/api/progmob/mhs/create",
       headers: {"content-type": "application/json"},
       body: mhsToJson(data),
     );
     if (response.statusCode == 200) {
       return true;
     } else {
       return false;
     }
  }

  Future<bool> createMhsWithFoto(Mhs data, File file, String filename) async {
     var request = http.MultipartRequest(
       'POST',
       Uri.parse("$baseUrl/api/progmob/mhs/createwithfoto")
     );

     Map<String,String> headers={
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

  Future<bool> updateMhsWithFoto(Mhs data, File file, String nimcari) async {
     String isfotoupdt = "0";
     var request = http.MultipartRequest(
       'POST',
       Uri.parse("$baseUrl/api/progmob/mhs/updatewithfoto")
     );

     Map<String,String> headers={
       "Content-type": "multipart/form-data"
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
       isfotoupdt = "1";
     }

     request.fields.addAll({
       "nama": data.nama,
       "nim": data.nim,
       "alamat": data.alamat,
       "email": data.email,
       "nim_progmob": data.nim_progmob,
       "nim_cari":nimcari,
       "is_foto_updt": isfotoupdt
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
      body: jsonEncode(<String, String>{
        "nim": nim,
        "nim_progmob": "72180184"
      })
    );

     if (response.statusCode == 200) {
    return true;
    } else {
    return false;
    }
  }

}//api_class