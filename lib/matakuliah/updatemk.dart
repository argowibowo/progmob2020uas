import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

class UpdateMk extends StatefulWidget{
  final String title;
  Matakuliah mk;
  String kodecari;

  UpdateMk({Key key, @required this.title, @required this.mk, @required this.kodecari}) : super(key: key);

  @override
  _UpdateMkState createState() => _UpdateMkState(title, mk, kodecari);
}

class _UpdateMkState extends State<UpdateMk> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Matakuliah mk;
  String kodecari;
  bool _isLoading = false;

  _UpdateMkState(this.title, this.mk, this.kodecari);

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
                          labelText: "KODE",
                          hintText:  "KODE",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mk.kode,
                        onSaved: (String value){
                          this.mk.kode = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nama",
                          hintText:  "Nama Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mk.nama,
                        onSaved: (String value){
                          this.mk.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Hari",
                          hintText:  "Menggunakan angka",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mk.hari,
                        onSaved: (String value){
                          this.mk.hari = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Sesi",
                          hintText:  "Sesi",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mk.sesi,
                        onSaved: (String value){
                          this.mk.sesi = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "SKS",
                          hintText:  "SKS",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mk.sks,
                        onSaved: (String value){
                          this.mk.sks = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        color: Colors.blueAccent,
                        onPressed: (){
                          return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Update Data"),
                                content: Text("Apakah yakin ingin menyimpan data ini? "),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.mk.nim_progmob = "72180198";
                                      ApiServices().updateMk(this.mk, kodecari).then((isSuccess){
                                        setState(() => _isLoading = false);
                                        if(isSuccess){
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("Ya"),
                                  ),
                                  FlatButton(
                                      onPressed:(){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Tidak")
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _isLoading ? Stack(
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
            )
        ),
      ),
    );
  }
}

