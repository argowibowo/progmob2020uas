import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMhs extends StatefulWidget {
  final String title;

  AddMhs({Key key, @required this.title}) : super(key: key);

  @override
  _AddMhsState createState() => new _AddMhsState(title);
}

class _AddMhsState extends State<AddMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddMhsState(this.title);

  bool _isLoading = false;
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
        backgroundColor: Colors.cyan,
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
                        hintText: "Email Mahasiswa",
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
                    _imageFile == null
                        ? Text("Silahkan Memilih Gambar !")
                        : Image.file(
                            _imageFile,
                            fit: BoxFit.cover,
                            height: 300.0,
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                          ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      color: Colors.cyan,
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          Text(
                            "Upload Foto",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      color: Colors.cyan,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content:
                                  Text("Apakah Anda Yakin Dengan Data Anda?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak"),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.mhs.nim_progmob = "72180190";
                                    List<int> imageBytes =
                                        _imageFile.readAsBytesSync();
                                    this.mhs.foto = base64Encode(imageBytes);
                                    ApiServices()
                                        .createMhsWithFoto(this.mhs, _imageFile,
                                            _imageFile.path)
                                        .then((isSuccess) {
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
                                  child: Text("Ya"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
                  ? Stack(
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(),
                        ),
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
