import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baru1/model.dart';
import 'package:baru1/apiservices.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

class UpdateMhs extends StatefulWidget{
  final String title;
  Mahasiswa mhs;
  String nimcari;

  UpdateMhs({Key key, @required this.title, @required this.mhs, @required this.nimcari}) : super(key: key);

  @override
  _UpdateMhsState createState() => _UpdateMhsState(title, mhs, nimcari);
}

class _UpdateMhsState extends State<UpdateMhs> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  Mahasiswa mhs;
  String nimcari;
  bool _isLoading = false;
  File _imageFile;

  _UpdateMhsState(this.title, this.mhs, this.nimcari);

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
                          hintText:  "NIM",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mhs.nim,
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
                          hintText:  "Nama Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mhs.nama,
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
                          hintText:  "Alamat Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mhs.alamat,
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
                          hintText:  "Email Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.mhs.email,
                        keyboardType:  TextInputType.emailAddress,
                        onSaved: (String value){
                          this.mhs.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      (_imageFile == null && this.mhs.foto == null)
                          ?
                      Text("Pilih gambar")
                          :
                      (_imageFile != null)
                          ?
                      Image.file(
                        _imageFile,
                        fit: BoxFit.cover,
                        height: 300,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      )
                          :
                      Image.network(
                        this.mhs.foto,
                        fit: BoxFit.cover,
                        height: 300,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        color: Colors.blueAccent,
                        onPressed: (){
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.image, color: Colors.white,),
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
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        color: Colors.blueAccent,
                        onPressed: (){
                          return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Update Data"),
                                content: Text("Apakah yakin ingin menyimpan data ini? "),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.mhs.nim_progmob = "72180198";
                                      ApiServices().updatewithfoto(this.mhs, _imageFile, nimcari).then((isSuccess){
                                        setState(() => _isLoading = false);
                                        if(isSuccess){
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("Ya"),
                                  ),
                                  FlatButton(
                                      onPressed:(){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Tidak")
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _isLoading ? Stack(
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
            )
        ),
      ),
    );
  }
}
