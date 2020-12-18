import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_72180247/apiservice.dart';
import 'package:flutter_72180247/model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDosen extends StatefulWidget{
  final String title;
  Dosen dosen;
  String nidncari;

  UpdateDosen({Key key, @required this.title, @required this.dosen, @required this.nidncari}) : super(key: key);

  @override
  _UpdateDosenState createState() => _UpdateDosenState(title, dosen, nidncari);
}

class _UpdateDosenState extends State<UpdateDosen>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nidncari;
  Dosen dosen;
  bool _isloading = false;
  File _imageFile;

  _UpdateDosenState(this.title, this.dosen, this.nidncari);

  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Color(0xffff4d4d),
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10,0,10,10),
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
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.dosen.nidn,
                        onSaved: (String value){
                          this.dosen.nidn = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.dosen.nama,
                        onSaved: (String value){
                          this.dosen.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        ),
                        initialValue: this.dosen.alamat,
                        onSaved: (String value){
                          this.dosen.alamat = value;
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
                        initialValue: this.dosen.email,
                        onSaved: (String value){
                          this.dosen.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //ternary operation == objek ? true : false atau else
                      (_imageFile == null && this.dosen.foto ==null)
                          ?
                      Text('Silahkan masukan gambar')
                          :
                      (_imageFile !=null)
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
                        this.dosen.foto,
                        fit: BoxFit.cover,
                        height: 300,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
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
                                        this.dosen.nim_progmob = "72180247";
                                        ApiServices().updateDosenWithFoto(this.dosen, _imageFile, nidncari).then((isSuccess){
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