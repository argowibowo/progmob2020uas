import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDosen extends StatefulWidget {
  final String title;
  Dosen dsn;
  String nama;
  String nidn;
  String alamat;
  String email;
  String gelar;

  AddDosen({Key key, @required this.title }) : super(key: key);

  @override
  _AddDosenState createState() => new _AddDosenState(title);
}

class _AddDosenState extends State<AddDosen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDosenState(this.title);
  bool _isLoading = false;
  Dosen dsn = new Dosen();
  File _imageFile;

  // Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
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
                        decoration: InputDecoration(
                            labelText: "NIDN",
                            hintText: "NIDN",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.dsn.nidn = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Nama",
                            hintText: "Nama Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.dsn.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Alamat",
                            hintText: "Alamat Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value){
                          this.dsn.alamat = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value){
                          this.dsn.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Gelar",
                        hintText: "Gelar Dosen",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                    ),
                    onSaved: (String value){
                      this.dsn.gelar = value;
                       },
                    ),
                      SizedBox(
                        height: 15,
                      ),
                      // ternary operation ====== object? true : false atau else
                      _imageFile == null
                          ? Text('Silahkan memilih gambar terlebih dahulu')
                          : Image.file(_imageFile,
                        fit: BoxFit.cover,
                        height: 300.0,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image,color: Colors.white70,),
                            Text("Upload foto", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
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
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Simpan Data"),
                                content: Text("Apakah data ini akan disimpan?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.dsn.nim_progmob = "72180183";
                                      //this.dsn.foto = this._imageFile.path;
                                      //this.dsn.foto = base64Encode(_imageFile.readAsBytesSync());
                                      //List<int> imageBytes = _imageFile.readAsBytesSync();
                                      //this.dsn.foto = base64Encode(imageBytes);
                                      ApiServices().createDosenWithFoto(this.dsn, _imageFile, _imageFile.path).then((isSuccess) {
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