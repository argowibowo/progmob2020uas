import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app_2020/apiservice.dart';
import 'package:flutter_app_2020/model.dart';
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDsn extends StatefulWidget {
  AddDsn({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddDsnState createState() => _AddDsnState(title);
}

class _AddDsnState extends State<AddDsn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDsnState(this.title);
  bool isLoading = false;
  Dosen dosen = new Dosen();
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[700],
      ),
      backgroundColor: Colors.red[100],

      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "NIDN",
                          hintText: "NIDN",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                        this.dosen.nidn = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                        this.dosen.nama = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value) {
                        this.dosen.alamat = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value) {
                        this.dosen.email = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Gelar",
                          hintText: "Gelar Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value) {
                        this.dosen.gelar = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _imageFile == null
                        ? Text("Silahkan pilih gambar")
                        : Image.file(
                      _imageFile,
                      fit: BoxFit.cover,
                      height: 300.0,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.brown,
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.image, color: Colors.white,),
                          Text(
                            "Upload",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.brown,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content: Text("Apakah data ini akan anda simpan ?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => isLoading = true);
                                      this.dosen.nim_progmob = "72180239";
                                      ApiServices().createDosenWithFoto(this.dosen, _imageFile, _imageFile.path).then((isSuccess) {
                                        setState(() => isLoading = false);
                                        if (isSuccess) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("Ya")
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak")
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Center(
              //   child: CircularProgressIndicator(),
              // )
              isLoading
                  ? Stack(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
                  : Container(),
              SizedBox(
                height: 20,
              ),
            ],
          ),

        ),
      ),
    );
  }
}