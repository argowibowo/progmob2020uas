import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class readJdwl extends StatefulWidget {
  final String title;
  Jadwal jdwl;
  readJdwl({Key key, @required this.title,@required this.jdwl}) : super(key: key);
  @override
  _readJdwlState createState() => _readJdwlState(title,jdwl);
}

class _readJdwlState extends State<readJdwl> {
  final String title;
  Jadwal jdwl;
  _readJdwlState(this.title,this.jdwl);
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
                        hintText: 'Matakuliah'
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: this.jdwl.matkul,
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
                        hintText: 'Nama Dosen'
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
                      labelText: this.jdwl.dosen,
                      hintText: "Nama Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Alamat'
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
                      labelText: this.jdwl.nidn,
                      hintText: "Alamat Mahasiswa",
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
                      labelText: this.jdwl.hari,
                      hintText: "Email Mahasiswa",
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
                      labelText: this.jdwl.sesi,
                      hintText: "gelar Mahasiswa",
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
                      labelText: this.jdwl.sks,
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
