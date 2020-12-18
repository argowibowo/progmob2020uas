import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddJadwal extends StatefulWidget {
  AddJadwal({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddJadwalState createState() => _AddJadwalState(title);
}

class _AddJadwalState extends State<AddJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddJadwalState(this.title);
  bool isLoading = false;
  Jadwal jadwal = new Jadwal();

  String dosen;
  List<dynamic> listDosen = new List();

  String matkul;
  List<dynamic> listMatkul = new List();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  void getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180180");
    var listDataDosen = jsonDecode(response.body);
    setState(() {
      listDosen = listDataDosen;
    });
    // print("data : $listDataDosen");
  }

  void getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180180");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      listMatkul = listDataMatkul;
    });
    // print("data : $listDataMatkul");
  }

  @override
  void initState() {
    super.initState();
    getMatkul();
    getDosen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formState,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              new Container(
                // padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                // decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.cyan, width: 2),
                  // color: Colors.cyan
                // ),
                // height: 65,
                child: DropdownButtonFormField(
                  hint: Text("Pilih Matakuliah"),
                  isExpanded: true,
                  value: matkul,
                  items: listMatkul.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['nama'] + ' - Hari ' + item['hari']  + ' - Sesi ' + item['sesi']),
                      value: item['id'],
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      matkul = value;
                    });
                  },
                  onSaved: (value){
                    this.jadwal.id_matkul = matkul;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.cyan, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              new Container(
                // padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                // height: 65,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: Colors.cyan, width: 2),
                //   // color: Colors.cyan
                // ),
                child: DropdownButtonFormField(
                  hint: Text("Pilih Dosen"),
                  isExpanded: true,
                  value: dosen,
                  items: listDosen.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['nama'] + ", " + item['gelar']),
                      value: item['id'],
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      dosen = value;
                    });
                  },
                  onSaved: (value){
                    this.jadwal.id_dosen = dosen;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.cyan, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.all(3),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: new MaterialButton(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Simpan Data"),
                          content: Text("Apakah Anda akan menyimpan data ini?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () async {
                                  _formState.currentState.save();
                                  setState(() => isLoading = true);
                                  this.jadwal.nim_progmob = "72180180";
                                  // ApiServices().createJadwal(this.jadwal).then((isSuccess) {
                                  //   setState(() => isLoading = false);
                                  //   if (isSuccess) {
                                  //     Navigator.pop(context);
                                  //     Navigator.pop(context);
                                  //     // print("masuk success");
                                  //   } else {
                                  //     Navigator.pop(context);
                                  //     Navigator.pop(context);
                                  //     // print("masuk else");
                                  //   }
                                  // });
                                  ApiServices().createJadwal(this.jadwal, dosen, matkul).then((isSuccess) {
                                    setState(() => isLoading = false);
                                    if (isSuccess) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      // print("masuk success");
                                    } else {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      // print("masuk else");
                                    }
                                  });
                                },
                                child: Text("Ya")
                            ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak")
                            )
                          ],
                        );
                      },
                    );
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
              )
            ],
          ),
        ),
      )
    );
  }
}