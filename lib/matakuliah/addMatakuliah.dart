import 'dart:async';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMatakuliah extends StatefulWidget {
  AddMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddMatakuliahState createState() => _AddMatakuliahState(title);
}

class _AddMatakuliahState extends State<AddMatakuliah> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddMatakuliahState(this.title);

  bool _isLoading = false;
  Matakuliah matkul = new Matakuliah();

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
            child: Stack(
          //karena menyediakan teampilan gambar yg cukup besar
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
                        labelText: "Kode Matakuliah",
                        hintText: "Kode Matakuliah",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value) {
                        this.matkul.kode = value;
                      },
                      validator: (value) {
                        if (this.matkul.kode == null) {
                          return "Kode Matakuliah tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value) {
                        this.matkul.nama = value;
                      },
                      validator: (value) {
                        if (this.matkul.nama == null) {
                          return "Nama Matakuliah tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        hintText: "Hari",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value) {
                        this.matkul.hari = value;
                      },
                      validator: (value) {
                        if (this.matkul.hari == null) {
                          return "Hari tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi",
                        hintText: "Sesi",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sesi = value;
                      },
                      validator: (value) {
                        if (this.matkul.sesi == null) {
                          return "Sesi tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "SKS",
                        hintText: "SKS",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sks = value;
                      },
                      validator: (value) {
                        if (this.matkul.sks == null) {
                          return "SKS tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.greenAccent,
                    onPressed: () {
                      if (_formState.currentState.validate()) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan data"),
                              content:
                                  Text("Apakah anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.matkul.nim_progmob = "72180196";
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
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak"),
                                )
                              ],
                            );
                          },
                        );
                      }
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
                      /*Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),*/
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  )
                : Container(),
          ],
        )),
      ),
    );
  }
}

String pilihHari = "";

final hariSelected = TextEditingController();
