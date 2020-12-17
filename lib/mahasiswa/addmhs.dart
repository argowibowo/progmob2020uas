import 'package:flutter/material.dart';
import 'package:flutter_72180247/apiservice.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_72180247/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMhs extends StatefulWidget{
  final String title;

  AddMhs({Key key, @required this.title}) : super(key: key);

  @override
_AddMhsState createState() => new _AddMhsState(title);
}

class _AddMhsState extends State<AddMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddMhsState(this.title);

  bool _isloading = false;
  Mahasiswa mhs = new Mahasiswa();
  File _imageFile;

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
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                          labelText: "NIM",
                          hintText: "NIM",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (String value) {
                          this.mhs.nim = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        onSaved: (String value) {
                          this.mhs.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        onSaved: (String value) {
                          this.mhs.alamat = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value) {
                          this.mhs.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //ternary operation == objek ? true : false atau else
                      _imageFile == null
                          ? Text('Silahkan masukan gambar')
                          : Image.file(
                        _imageFile,
                        fit: BoxFit.cover,
                        height: 300,
                        alignment: Alignment.topCenter,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        color: Colors.blue,
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image, color: Colors.white),
                            Text("Upload Foto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          color: Colors.blue,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Simpan"),
                                  content: Text(
                                      "Apakah anda ingin menyimpan data ini?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async {
                                        _formState.currentState.save();
                                        setState(() => _isloading = true);
                                        this.mhs.nim_progmob = "72180247";
                                        List<int> imageBytes = _imageFile
                                            .readAsBytesSync();
                                        this.mhs.foto =
                                            base64Encode(imageBytes);
                                        ApiServices().createWithFoto(
                                            this.mhs, _imageFile,
                                            _imageFile.path).then((isSuccess) {
                                          setState(() => _isloading = false);
                                          if (isSuccess) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text('Ya'),
                                    ),
                                    FlatButton(onPressed: () {
                                      Navigator.pop(context);
                                    },
                                      child: Text("Tidak"),
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
                          )
                      )
                    ],
                  )
              ),
              _isloading
                  ? Stack(
                children: <Widget>[
                  Opacity(opacity: 0.3,
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