import 'package:flutter/material.dart';
import 'package:simpelproject/apiservice.dart';
import 'dart:convert';
import 'dart:io';
import 'package:simpelproject/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddJadwal extends StatefulWidget {
  final String title;

  AddJadwal({Key key, @required this.title}) : super(key: key);

  @override
  _AddJadwalState createState() => new _AddJadwalState(title);
}

class _AddJadwalState extends State<AddJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddJadwalState(this.title);
  bool _isLoading = false;
  Jadwal jadwal = new Jadwal();
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
                        labelText: "Sesi",
                        hintText: "Sesi",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value){
                        this.jadwal.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Hari",
                          hintText: "Hari",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value){
                        this.jadwal.hari = value;
                      },
                    ),
                     TextFormField(
                      decoration: InputDecoration(
                        labelText: "Ruangan",
                        hintText: "Ruangan",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value){
                        this.jadwal.ruangan = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Jam",
                          hintText: "Jam",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      onSaved: (String value){
                        this.jadwal.jam = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.red,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Save Data"),
                              content: Text(
                                  "Pastikan data yang di isi sudah benar!"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    ApiServices().createJadwal(
                                        this.jadwal).then((isSuccess) {
                                      setState(() => _isLoading = false);
                                      if (isSuccess) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    });
                                  },
                                  child: Text('Yes'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
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
                      opacity: 0.5,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.lightGreenAccent,
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