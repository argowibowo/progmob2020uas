import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class readMtk extends StatefulWidget {
  final String title;
  Matakuliah mtk;
  readMtk({Key key, @required this.title,@required this.mtk}) : super(key: key);
  @override
  _readMtkState createState() => _readMtkState(title,mtk);
}

class _readMtkState extends State<readMtk> {
  final String title;
  Matakuliah mtk;
  _readMtkState(this.title,this.mtk);
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
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kode'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.mtk.kode,
                      hintText: "NIM",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nama Matkul'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mtk.nama,
                      hintText: "Nama Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Hari'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mtk.hari,
                      hintText: "Alamat Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Sesi'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mtk.sesi,
                      hintText: "Email Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'SKS'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: this.mtk.sks,
                      hintText: "gelar Mahasiswa",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
