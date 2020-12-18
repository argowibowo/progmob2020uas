import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../apiservice.dart';
import '../model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class UpdateMt extends StatefulWidget{
  final String title;
  Matakuliah mt;
  String kode;

  UpdateMt({Key key, @required this.title, @required this.mt, @required this.kode}) : super(key: key);

  @override
  _UpdateMtState createState() => _UpdateMtState(title,mt, kode);
}

class _UpdateMtState extends State<UpdateMt>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kode;
  Matakuliah mt;
  bool _isLoading = false;
  File _imageFile;

  _UpdateMtState(this.title, Mt, this.kode);

  //// memeilih dari galeri
  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                            labelText: "Kode",
                            hintText: "Kode",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          ),
                          initialValue: this.mt.kodeMatakuliah,
                          onSaved: (String value){
                            this.mt.kodeMatakuliah = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Matkul",
                            hintText: " Matkul",
                          ),
                          initialValue: this.mt.nama,
                          onSaved: (String value){
                            this.mt.nama=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Hari",
                            hintText: " Hari",
                          ),
                          initialValue: this.mt.hari,
                          keyboardType: TextInputType.text,
                          onSaved: (String value){
                            this.mt.hari = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Sesi",
                            hintText: " Sesi",
                          ),
                          initialValue: this.mt.sesi,
                          keyboardType: TextInputType.text,
                          onSaved: (String value){
                            this.mt.sesi = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "SKS",
                            hintText: " SKS",
                          ),
                          initialValue: this.mt.sks,
                          keyboardType: TextInputType.text,
                          onSaved: (String value){
                            this.mt.sks = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          color: Colors.blue,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Save Data"),
                                  content: Text(" Yakin Menyimpan data"),
                                  actions: <Widget>[

                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text ("No"),
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
                      ]
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
                      child:  CircularProgressIndicator(),

                    )
                  ],
                )
                    : Container(),
              ],
            ),
          )
      ),
    );
  }
}
