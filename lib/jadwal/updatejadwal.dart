import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateJadwal extends StatefulWidget{
  final String title;
  Jadwal jadwal;
  //Matkul matkul;
  //Dosen dosen;
  String id_cari /*, id_dosen, id_matkul*/;

  UpdateJadwal({Key key, @required this.title, @required this.jadwal, @required this.id_cari /*, @required this.id_dosen, @required this.id_matkul*/}) : super(key: key);

  @override
  _UpdateJadwalState createState() => _UpdateJadwalState(title, jadwal, id_cari /*, id_dosen, id_matkul*/);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String id_cari;
  //String id_dosen, id_matkul;

  Jadwal jadwal;
  //Matkul matkul;
  //Dosen dosen;
  bool _isLoading = false;

  _UpdateJadwalState(this.title, this.jadwal, this.id_cari /*, this.id_dosen, this.id_matkul*/);

  //String _valDosen ;//value ambil id_dosen, utk initial value
  //String idDosenUpdate; //utk value id dosen baru
  List<dynamic> lDosen = new List();

  //String _valMatkul; //value ambil id_matkul, utk initial value
  //String idMatkulUpdate; //utk value id matkul baru
  List<dynamic> lMatkul = new List();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  void getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180200");
    var listDataDosen = jsonDecode(response.body);
    setState(() {
      lDosen = listDataDosen;
    });
    //print("data : $listDataDosen");
  }

  void getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180200");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      lMatkul = listDataMatkul;
    });
    //print("data : $listDataMatkul");
  }

  // UNTUK ALERT DIALOG SAAT SALAH SATU MATKUL/ DOSEN TIDAK DIUPDATE TAPI TIDAK MEMILIH
  _displayDialogUpdate(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 2,
            title: Text(
              "Update Failed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              "Pilihan matakuliah/ dosen harus dipilih semua walaupun pilihannya tetap sama",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF0D47A1),
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () async{
                  Navigator.pop(context);
                },
                child: Text(
                  "Keluar",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getMatkul();
    getDosen();
    //print(id_dosen);
    //print(this.jadwal.id_dosen);
    //print(id_matkul);
    //print(this.jadwal.id_matkul);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(this.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Container(
        child: Form(
          key: _formState,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox( //kasih jarak antar textformfield
                  height: 15,
                ),
/*                Column(
                  children: <Widget>[
                    Text(
                      "Untuk update pilihan matakuliah harus tetap dipilih walaupun pilihannya tetap sama",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox( //kasih jarak antar textformfield
                  height: 15,
                ),*/
                DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text(
                    this.jadwal.matkul + " - Hari " + this.jadwal.hari + ", Sesi " + this.jadwal.sesi + ", SKS " + this.jadwal.sks,
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 1,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  elevation: 2,
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF0D47A1),
                  ),
                  value: this.jadwal.id_matkul,
                  items: lMatkul.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item['nama'] + " - "+ "Hari " + item['hari'] + ", "+ "Sesi " + item['sesi']+ ", "+ "SKS " + item['sks'],
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      value: item['id'], //id matkul yang diambil valuenya
                    );
                  }).toList(),
                  //onTap: (){
                    //print(this.idMatkulUpdate);
                    //print(id_matkul);
                  //},
                  onChanged: (value){
                    setState(() {
                      this.jadwal.id_matkul = value;
                    });
                  },
                  onSaved: (value){
                    setState(() {
                      this.jadwal.id_matkul = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                      borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if(this.jadwal.id_matkul == null){
                      return "Pilihan Matakuliah Harus Dipilih Walaupun Pilihan Tetap Sama";
                    } else{
                      return null;
                    }
                  },
                ),
/*                SizedBox( //kasih jarak antar textformfield
                  height: 15,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Untuk update pilihan dosen harus tetap dipilih walaupun pilihannya tetap sama",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),*/
                SizedBox( //kasih jarak antar textformfield
                  height: 15,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text(
                    this.jadwal.dosen + " - NIDN " + this.jadwal.nidn,
                    style: TextStyle(
                      fontSize: 15.0,
                      height: 1,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  elevation: 2,
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF0D47A1),
                  ),
                  value: this.jadwal.id_dosen,
                  items: lDosen.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item['nama'] + " - " + "NIDN " + item['nidn'],
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      value: item['id'], //id dosen yg diambil valuenya
                    );
                  }).toList(),
                  //onTap: (){
                    //print (this.jadwal.id_dosen + " " + this.jadwal.dosen);
                    //print (id_dosen);
                  //},
                  onChanged: (value){
                    setState(() {
                      this.jadwal.id_dosen= value; //kalau pilhan ganti, id_dosen juga ganti
                    });
                  },
                  onSaved: (value){
                    setState(() {
                      this.jadwal.id_dosen = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                      borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if(this.jadwal.id_dosen == null){
                      return "Pilihan Dosen Harus Dipilih Walaupun Pilihan Tetap Sama";
                    } else{
                      return null;
                    }
                  },
                ),
                SizedBox( //kasih jarak antar textformfield
                  height: 15,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.green,
                  onPressed: (){
                    if(_formState.currentState.validate()){
                      return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text(
                                "Simpan Data",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF0D47A1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              content: Text(
                                "Apakah Anda akan menyimpan data ini?",
                                style: TextStyle(
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async{
                                    _formState.currentState.save();
                                    setState(() =>_isLoading = true);
                                    this.jadwal.nim_progmob = "72180200";
                                    //print(_valDosen + " " + _valMatkul);
                                    ApiServices().updateJadwal(this.jadwal, id_cari /*, this.dosen, this.matkul*/).then((isSuccess) {
                                      setState(() => _isLoading = false);
                                      if (isSuccess){
                                        //print("dosen" + this.jadwal.id_dosen + " matkul " + this.jadwal.id_matkul);
                                        //print("dosen" + this.jadwal.dosen + " matkul " + this.jadwal.matkul);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }else{
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    });
                                  },
                                  child: Text(
                                    "Ya",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Tidak",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      );
                    } else {
                      _displayDialogUpdate(context);
                    }
                  },
                  child: Text(
                    "Simpan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}