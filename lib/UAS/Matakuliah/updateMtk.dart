import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class updateMtk extends StatefulWidget {
  final String title;
  Matakuliah mtk;
  String kode_cari;
  updateMtk({Key key, @required this.title,@required this.mtk,@required this.kode_cari}) : super(key: key);
  @override
  _updateMtkState createState() => _updateMtkState(title,mtk,kode_cari);
}

class _updateMtkState extends State<updateMtk> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Matakuliah mtk;
  final String kode_cari;
  _updateMtkState(this.title,this.mtk,this.kode_cari);
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(this.title)
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
                        labelText: "kode",
                        hintText: "kode",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.mtk.kode,
                      onSaved: (String value) {
                        this.mtk.kode = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Nama",
                        hintText: "Nama Matakuliah",
                      ),
                      initialValue: this.mtk.nama,
                      onSaved: (String value) {
                        this.mtk.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "hari",
                        hintText: "hari (cont:senin=1)",
                      ),
                      initialValue: this.mtk.hari,
                      onSaved: (String value) {
                        this.mtk.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "sesi",
                        hintText: "sesi Matakuliah",
                      ),
                      initialValue: this.mtk.sesi,
                      onSaved: (String value) {
                        this.mtk.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "sks",
                        hintText: "sks Matakuliah",
                      ),
                      initialValue: this.mtk.sks,
                      onSaved: (String value) {
                        this.mtk.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("simpan"),
                              content: Text("apakah ingin disimpan"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.mtk.nim_progmob = "72180186";
                                      ApiServices().updateMtk(
                                        this.mtk,
                                        kode_cari,
                                      ).then((isSuccess) {
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
                                    child: Text("yes")
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("no")
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text("simpan",
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
                  ? Stack(
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
                  )
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
