import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../apiservice.dart';
import '../model.dart';



final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class AddJd extends StatefulWidget{
  final String title;

  AddJd({Key key, @required this.title}) : super(key: key);

  @override
  _AddJdState createState() => new _AddJdState(title);
}

class _AddJdState extends State<AddJd>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddJdState(this.title);
  bool _isLoading = false;
  Jadwal jw = new Jadwal();
  File  _imageFile;

  //// memeilih dari galeri
  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

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
                          /*
                           String id;
  String matkul;
  String dosen;
  String nidn;
  String hari;
  String sesi;
  String sks;
                           */
                          decoration: InputDecoration(
                            labelText: "Matkul",
                            hintText: "Matkul",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          ),
                          onSaved: (String value){
                            this.jw.matkul = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Dosen",
                            hintText: " Dosen",
                          ),
                          onSaved: (String value){
                            this.jw.dosen=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "nidn",
                            hintText: " nidn",
                          ),
                          onSaved: (String value){
                            this.jw.nidn=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "hari",
                            hintText: " hari",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.jw.hari = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "sesi",
                            hintText: " sesi",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.jw.sesi = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "sks",
                            hintText: " sks",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.jw.sks = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _imageFile == null
                            ? Text('Pilih gambar')
                            : Image.file(
                          _imageFile,
                          fit: BoxFit.cover,
                          height: 300.0,
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            color:  Colors.blue,
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.image_aspect_ratio,
                                  color: Colors.white,),
                                Text ("Upload Foto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
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
                                  title: Text("Simpan Data"),
                                  content: Text("yakin untuk menyimpan data tersebut"),
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