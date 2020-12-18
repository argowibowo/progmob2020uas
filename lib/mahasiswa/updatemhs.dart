import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/apiservices.dart';
import 'dart:io';
import 'package:flutter_progmob_2020/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateMhs extends StatefulWidget {
  final String title;
  Mahasiswa mahasiswa;
  String nimcari;

  UpdateMhs({Key key, @required this.title, @required this.mahasiswa, @required this.nimcari }) : super(key: key);

  @override
  _UpdateMhsState createState() => new _UpdateMhsState(title, mahasiswa, nimcari);
}

class _UpdateMhsState extends State<UpdateMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nimcari;
  bool _isLoading = false;
  Mahasiswa mahasiswa = new Mahasiswa();
  File _imageFile;

  _UpdateMhsState(this.title, this.mahasiswa, this.nimcari);

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
                            labelText: "NIM",
                            hintText: "NIM",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.mahasiswa.nim,
                        onSaved: (String value){
                          this.mahasiswa.nim = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.mahasiswa.nama,
                        onSaved: (String value){
                          this.mahasiswa.nama = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        initialValue: this.mahasiswa.alamat,
                        onSaved: (String value){
                          this.mahasiswa.alamat = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email Mahasiswa",
                          // border: OutlineInputBorder(),
                          // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        keyboardType: TextInputType.emailAddress,
                        initialValue: this.mahasiswa.email,
                        onSaved: (String value){
                          this.mahasiswa.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ternary operation ====== object? true : false atau else
                      (_imageFile == null && this.mahasiswa.foto == null)
                          ?
                      Text('Upload Foto')
                          :
                      (_imageFile != null)
                          ?
                      Image.file(
                        _imageFile,
                        fit: BoxFit.cover,
                        height: 300.0,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      )
                          :
                      Image.network(
                        this.mahasiswa.foto,
                        fit: BoxFit.cover ,
                        height: 250.0,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.redAccent,
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image,color: Colors.white70,),
                            Text("Pilih Foto",
                              textAlign: TextAlign.center,
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
                        color: Colors.red,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update Data"),
                                content: Text(
                                    "Pastikan data yang valid!"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.mahasiswa.nim_progmob = "72180182";
                                      ApiServices().updateMhsWithFoto(this.mahasiswa, _imageFile, nimcari).then((isSuccess){
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
                        child: Text("Save",
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