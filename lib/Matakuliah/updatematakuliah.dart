import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';
import 'package:image_picker/image_picker.dart';

import '../apiservices.dart';

class UpdateMtkl extends StatefulWidget {
  UpdateMtkl({Key key, @required this.title, @required this.mtkl, @required this.kodecari}) : super(key: key);

  final String title;
  Matkul mtkl;
  String kodecari;

  @override
  _UpdateMtklState createState() => _UpdateMtklState(title,mtkl,kodecari);
}

class _UpdateMtklState extends State<UpdateMtkl> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  bool _isLoading =false;
  Matkul mtkl = new Matkul();
  File _imageFile;

  _UpdateMtklState(this.title, this.mtkl, this.kodecari);

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
                        labelText: "Kode",
                        hintText: "Kode",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.mtkl.kode,
                      onSaved: (String value){
                        this.mtkl.kode = value;
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
                      initialValue: this.mtkl.nama,
                      onSaved: (String value){
                        this.mtkl.nama = value;
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
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.mtkl.hari,
                      onSaved: (String value){
                        this.mtkl.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi",
                        hintText: "Sesi",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.mtkl.sesi,
                      onSaved: (String value){
                        this.mtkl.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sks",
                        hintText: "Sks",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.mtkl.sks,
                      onSaved: (String value){
                        this.mtkl.sks = value;
                      },
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // (_imageFile == null && this.dsn.foto == null)
                    //     ?
                    // Text("Silahkan Memilih Gambar Terlebih Dahulu")
                    //     :
                    // (_imageFile != null)
                    //     ?
                    // Image.file(
                    //   _imageFile,
                    //   fit: BoxFit.cover,
                    //   height: 300.0,
                    //   alignment: Alignment.topCenter,
                    //   width: MediaQuery.of(context).size.width,
                    // )
                    //     :
                    // Image.network(
                    //   this.dsn.foto,
                    //   fit: BoxFit.cover,
                    //   height: 300.0,
                    //   alignment: Alignment.topCenter,
                    //   width: MediaQuery.of(context).size.width,
                    // ),
                    // MaterialButton(
                    //   minWidth: MediaQuery.of(context).size.width,
                    //   padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //   color: Colors.blue,
                    //   onPressed: (){
                    //     _pickImage(ImageSource.gallery);
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       new Icon(Icons.image,color: Colors.white,),
                    //       Text("Upload Foto",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.purpleAccent,
                      onPressed: (){
                        return showDialog(
                            context:context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Simpan data"),
                                content: Text("Apakah Anda Akan Menyimpan Data ini ?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.mtkl.nim_progmob = "72180225";
                                      // List<int> imageBytes = _imageFile.readAsBytesSync();
                                      // this.mhs.foto = base64Decode(imageBytes);
                                      ApiServices().updateMatkul(this.mtkl, kodecari).then((isSuccess) {
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
                                    child: Text('Ya'),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak"),
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