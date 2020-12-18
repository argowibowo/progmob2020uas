import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class EditMatakuliah extends StatefulWidget {
  final String title;
  Matakuliah matkul;
  String kode_cari;

  EditMatakuliah(
      {Key key,
      @required this.title,
      @required this.matkul,
      @required this.kode_cari})
      : super(key: key);

  @override
  _EditMatakuliahState createState() =>
      _EditMatakuliahState(title, matkul, kode_cari);
}

class _EditMatakuliahState extends State<EditMatakuliah> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kode_cari;
  Matakuliah matkul;
  bool _isLoading = false;

  _EditMatakuliahState(this.title, this.matkul, this.kode_cari);

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: SingleChildScrollView(
            child: Stack(
          //karena menyediakan teampilan gambar yg cukup besar
          children: <Widget>[
            Form(
              key: _formState,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kode Matakuliah",
                        hintText: "Kode Matakuliah",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.matkul.kode,
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
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.matkul.nama,
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
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        hintText: "Hari",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.matkul.hari,
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
                    height: 15.0,
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
                      initialValue: this.matkul.sesi,
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
                    height: 15.0,
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
                      initialValue: this.matkul.sks,
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
                    height: 15.0,
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
                                        .updateMatkul(this.matkul, kode_cari)
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
