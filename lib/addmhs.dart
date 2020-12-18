import 'package:flutter/material.dart';
import 'package:simpelproject/apiservice.dart';
import 'dart:convert';
import 'dart:io';
import 'package:simpelproject/model.dart';
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
  Mhs mahasiswa = new Mhs();
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
                        labelText: "NIM",
                        hintText: "NIM",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
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
                      onSaved: (String value){
                        this.mahasiswa.email = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // ternary operation ====== object? true : false atau else
                    _imageFile == null
                        ? Text('Masukan gambar untuk melengkapi Data Mahasiswa')
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
                      color: Colors.redAccent,
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.image,color: Colors.white70,),
                          Text("Upload foto anda disini",
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
                              title: Text("Save Data"),
                              content: Text(
                                  "Pastikan data yang di isi sudah benar!"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.mahasiswa.nim_progmob = "72180268";
                                    List<int> imageBytes = _imageFile
                                        .readAsBytesSync();
                                    this.mahasiswa.foto =
                                        base64Encode(imageBytes);
                                    ApiServices().createMhsWithFoto(
                                        this.mahasiswa, _imageFile,
                                        _imageFile.path).then((isSuccess) {
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