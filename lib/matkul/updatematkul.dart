import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/apiservices.dart';
import 'package:flutter_progmob_2020/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateMatkul extends StatefulWidget {
  final String title;
  Matakuliah matkul;
  String kode_cari;

  UpdateMatkul({Key key, @required this.title, @required this.matkul, @required this.kode_cari }) : super(key: key);

  @override
  _UpdateMatkulState createState() => new _UpdateMatkulState(title, matkul, kode_cari);
}

class _UpdateMatkulState extends State<UpdateMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kode_cari;
  bool _isLoading = false;
  Matakuliah matkul = new Matakuliah();

  _UpdateMatkulState(this.title, this.matkul, this.kode_cari);

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
                            labelText: "Nama",
                            hintText: "Nama Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.matkul.nama,
                        onSaved: (String value){
                          this.matkul.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Kode",
                            hintText: "Kode Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.matkul.kodeMatakuliah,
                        onSaved: (String value){
                          this.matkul.kodeMatakuliah = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.matkul.hari,
                        onSaved: (String value){
                          this.matkul.hari = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Sesi",
                          hintText: "Sesi",
                          // border: OutlineInputBorder(),
                          // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.matkul.sesi,
                        onSaved: (String value){
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.matkul.sks,
                        onSaved: (String value){
                          this.matkul.sks = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.red,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update Data"),
                                content: Text(
                                    "Pastikan data yang valid!"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.matkul.nim_progmob = "72180182";
                                      ApiServices().updateMatkul(this.matkul, kode_cari).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess){
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text('Yes'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Save",
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
                      opacity: 0.5,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.lightGreenAccent,
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