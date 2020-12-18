import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/apiservices.dart';
import 'package:flutter_progmob/model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDsn extends StatefulWidget {
  final String title;
  Dosen dsn;
  String nidncari;

  UpdateDsn({Key key, @required this.title, @required this.dsn, @required this.nidncari}) : super(key: key);

  @override
  _UpdateDsnState createState() => _UpdateDsnState(title, dsn, nidncari);
}

class _UpdateDsnState extends State<UpdateDsn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nidncari;
  Dosen dsn;
  bool _isLoading = false;
  File _imageFile;

  _UpdateDsnState(this.title, this.dsn, this.nidncari);

  ///Select an image via gallery or camera
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
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.dsn.nidn,
                      onSaved: (String value){
                        this.dsn.nidn = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Nama",
                        hintText: "Nama Dosen",
                      ),
                      initialValue: this.dsn.nama,
                      onSaved: (String value){
                        this.dsn.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Alamat",
                        hintText: "Alamat Dosen",
                      ),
                      initialValue: this.dsn.alamat,
                      onSaved: (String value){
                        this.dsn.alamat = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Email Dosen",
                      ),
                      initialValue: this.dsn.email,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value){
                        this.dsn.email = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    (_imageFile == null && this.dsn.foto == null)
                        ?
                    Text('Silahkan memilih gambar terlebih dahulu')
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
                      this.dsn.foto,
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
                          new Icon(Icons.image,color: Colors.white,),
                          Text("Upload Foto",
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
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content: Text("Apakah Anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.dsn.nim_progmob = "72180266";
                                    ApiServices().updateDsnWithFoto(this.dsn, _imageFile, nidncari).then((isSucces) {
                                      setState(() => _isLoading = false);
                                      if (isSucces) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }else{
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
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
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