import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:progmob_setelah_uts_72180190/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMatkul extends StatefulWidget {
  final String title;

  AddMatkul({Key key, @required this.title}) : super(key: key);

  @override
  _AddMatkulState createState() => new _AddMatkulState(title);
}

class _AddMatkulState extends State<AddMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddMatkulState(this.title);

  bool _isLoading = false;
  Matakuliah matkul = new Matakuliah();

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
                              title: Text("Simpan Data"),
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
                                        .createMatkul(this.matkul)
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
