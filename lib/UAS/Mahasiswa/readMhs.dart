import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class readMhs extends StatefulWidget {
  final String title;
  Mahasiswa mhs;
  readMhs({Key key, @required this.title,@required this.mhs}) : super(key: key);
  @override
  _readMhsState createState() => _readMhsState(title,mhs);
}

class _readMhsState extends State<readMhs> {
  final String title;
  Mahasiswa mhs;
  _readMhsState(this.title,this.mhs);
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
                      hintText: 'NIM'
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: this.mhs.nim,
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
                      hintText: 'Nama'
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
                    labelText: this.mhs.nama,
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
                    labelText: this.mhs.alamat,
                    hintText: "Alamat Mahasiswa",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email'
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
                    labelText: this.mhs.email,
                    hintText: "Email Mahasiswa",
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

