import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateMatkul extends StatefulWidget {
  final String title;
  Matakuliah matkul;
  String kodecari;

  UpdateMatkul(
      {Key key,
        @required this.title,
        @required this.matkul,
        @required this.kodecari})
      : super(key: key);

  @override
  _UpdateMatkulState createState() => new _UpdateMatkulState(title, matkul, kodecari);
}

class _UpdateMatkulState extends State<UpdateMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  Matakuliah matkul;
  bool _isLoading = false;
  File _imageFile;

  _UpdateMatkulState(this.title, this.matkul, this.kodecari);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "NAMA",
                        hintText: "NAMA MATAKULIAH",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      ),
                      initialValue: this.matkul.nama,
                      onSaved: (String value) {
                        this.matkul.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "KODE",
                        hintText: "KODE MATAKULIAH",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      ),
                      initialValue: this.matkul.kode,
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.kode = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        hintText: "Hari",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      ),
                      initialValue: this.matkul.hari,
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.hari = value;
                      },
                    ),
                    Text(
                        "Senin= 1 | Selasa= 2 | Rabu= 3 | Kamis= 4 | Jumat= 5"),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "SESI",
                        hintText: "SESI",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      ),
                      initialValue: this.matkul.sesi,
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "SKS",
                        hintText: "SKS",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      ),
                      initialValue: this.matkul.sks,
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      color: Colors.cyan,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Update Data"),
                              content:
                              Text("Apakah Anda Yakin Dengan Data Anda?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak"),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.matkul.nim_progmob = "72180190";
                                    ApiServices()
                                        .updateMatkul(this.matkul, kodecari)
                                        .then((isSuccess) {
                                      setState(() => _isLoading = false);
                                      if (isSuccess) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      } else {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    });
                                  },
                                  child: Text("Ya"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
                  ? Stack(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
