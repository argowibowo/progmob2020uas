import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateJadwal extends StatefulWidget {
  final String title;
  Jadwal jadwal;
  String id_dosen;
  String id_matkul;

  UpdateJadwal({Key key, @required this.title, this.jadwal, this.id_dosen, this.id_matkul}) : super(key: key);

  @override
  _UpdateJadwalState createState() =>  _UpdateJadwalState(title, jadwal, id_dosen, id_matkul);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Jadwal jadwal;
  final String id_dosen;
  final String id_matkul;
  bool _isLoading = false;

  _UpdateJadwalState(this.title, this.jadwal, this.id_dosen, this.id_matkul);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
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
                            labelText: "Matkul",
                            hintText: "Nama Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.matkul = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Dosen",
                            hintText: "Nama Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.dosen = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "NIDN",
                            hintText: "NIDN",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.nidn = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "hari",
                            hintText: "hari",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.hari = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Sesi",
                            hintText: "Sesi",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.sesi = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.jadwal.sks = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ternary operation ====== object? true : false atau else
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Simpan Data"),
                                content: Text("Apakah data ini akan disimpan?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.jadwal.nim_progmob = "72180183";
                                      ApiServices().updateJadwal(this.jadwal, id_dosen, id_matkul).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text('Ya'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tidak'),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Simpan",
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
                _isLoading
                    ?Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
                    :Container(),
              ],
            ),
          )
      ),
    );
  }
}