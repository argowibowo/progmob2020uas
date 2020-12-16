import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/model.dart';
import 'package:image_picker/image_picker.dart';

class AddMhs extends StatefulWidget {
  AddMhs({Key key, this.title}) :super(key:key);
  final String title;

  @override

  _AddMhsState createState() => _AddMhsState(title);
}

class _AddMhsState extends State<AddMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddMhsState(this.title);
  bool _isLoading =false;
  Mahasiswa mhs = new Mahasiswa();
  File _imageFile;

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
                        decoration: InputDecoration(
                          labelText: "NIM",
                          hintText: "NIM",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value){
                          this.mhs.nim = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value){
                          this.mhs.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value){
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
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        onSaved: (String value){
                          this.mhs.email = value;
                        },
                      ),
                      _imageFile == null
                      ? Text("silahkan pilih")
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
                        color: Colors.blue,
                        onPressed: (){
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image,color: Colors.white,),
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
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        onPressed: (){
                          return showDialog(
                              context:context,
                            builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan data"),
                                  content: Text("Apakah simpan"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () async {
                                          _formState.currentState.save();
                                          setState(() => _isLoading = true);
                                          this.mhs.nim_progmob = "72180225";
                                          // List<int> imageBytes = _imageFile.readAsBytesSync();
                                          // this.mhs.foto = base64Decode(imageBytes);
                                          ApiServices().createMhsWithFoto(
                                              this.mhs, _imageFile,
                                              _imageFile.path).then((
                                              isSuccess) {
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
                                      child: Text('ya'),
                                    ),
                                    FlatButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("tidak"),
                                    )
                                  ],
                                );
                            }
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
                ? Stack(
                  children: <Widget>[
                    Opacity(
                        opacity:0.3,
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
                    : Container()
              ],
            ),
          ),
        ),
      );
  }
}