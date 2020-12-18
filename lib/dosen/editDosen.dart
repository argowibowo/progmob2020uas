import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class EditDosen extends StatefulWidget {
  final String title;
  Dosen dsn;
  String nidnCari;

  EditDosen(
      {Key key,
      @required this.title,
      @required this.dsn,
      @required this.nidnCari})
      : super(key: key);

  @override
  _EditDosenState createState() => _EditDosenState(title, dsn, nidnCari);
}

class _EditDosenState extends State<EditDosen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nidnCari;
  Dosen dsn;
  bool _isLoading = false;
  File _imageFile;

  _EditDosenState(this.title, this.dsn, this.nidnCari);

  //pilih foto dari gallery camera hp
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: SingleChildScrollView(
            child: Stack(
          //karena menyediakan teampilan gambar yg cukup besar
          children: <Widget>[
            Form(
              key: _formState,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "NIDN",
                        hintText: "NIDN",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: this.dsn.nidn,
                      onSaved: (String value) {
                        this.dsn.nidn = value;
                      },
                      validator: (value) {
                        if (this.dsn.nidn == null) {
                          return "NIDN tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.dsn.nama,
                      onSaved: (String value) {
                        this.dsn.nama = value;
                      },
                      validator: (value) {
                        if (this.dsn.nama == null) {
                          return "Nama tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Alamat",
                        hintText: "Alamat",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.dsn.alamat,
                      onSaved: (String value) {
                        this.dsn.alamat = value;
                      },
                      validator: (value) {
                        if (this.dsn.alamat == null) {
                          return "Alamat tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      initialValue: this.dsn.email,
                      onSaved: (String value) {
                        this.dsn.email = value;
                      },
                      validator: (value) {
                        if (this.dsn.email == null) {
                          return "Email tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "Gelar",
                        hintText: "Gelar",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      keyboardType: TextInputType.name,
                      initialValue: this.dsn.gelar,
                      onSaved: (String value) {
                        this.dsn.gelar = value;
                      },
                      validator: (value) {
                        if (this.dsn.gelar == null) {
                          return "Gelar tidak boleh kosong!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  (_imageFile == null && this.dsn.foto == null)
                      ? Text("Pilih Gambar")
                      : (_imageFile != null)
                          ? Image.file(
                              _imageFile,
                              fit: BoxFit.cover,
                              height: 300.0,
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                            )
                          : Image.network(
                              this.dsn.foto,
                              fit: BoxFit.cover,
                              height: 300.0,
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                            ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.deepPurple[900],
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.deepPurpleAccent[100],
                    onPressed: () {
                      if (_formState.currentState.validate()) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan data"),
                              content:
                                  Text("Apakah anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.dsn.nim_progmob = "72180196";
                                    ApiServices()
                                        .updateDsnWithFoto(
                                            this.dsn, _imageFile, nidnCari)
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
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak"),
                                )
                              ],
                            );
                          },
                        );
                      }
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
        )),
      ),
    );
  }
}
