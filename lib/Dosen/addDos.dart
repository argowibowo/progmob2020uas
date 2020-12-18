import 'package:flutter/material.dart';
import 'package:flutter_app_progmob_2020/apiservices.dart';
import 'dart.io';
import 'dart:convert';
import 'package:flutter_app_progmob_2020/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDos extends StatesfulWidget {
  final String title;

  AddDos({Key key, @required this.title}) : super(key: key);

  @override
  _AddDosState createState() => new _AddDosState(title);
}

class _AddDosState extends State<AddDos> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDosState(this.title);
  bool _isLoading = false;
  Dosen dos = new Dosen();
  file _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState((){
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
          child: SingleChildScrollview(
            child: Stack(
              children: <widget>[
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
                          onSaved: (String value){
                            this.dos.nidn = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String value){
                            this.dos.namados = value;
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
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String value){
                            this.dos.alamat = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.dos.email = value;
                          },
                        ),
                        _imageFile == null
                            ? Text('Silahkan memilih gambar terlebih dahulu')
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
                                ),
                              ],
                            )
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
                                  actions: <widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        setState(() => _isLoading = true);
                                        this.dos.nim_progmob = "72180179";
                                        List<int> imageBytes = _imageFile.readAsBytesSync();
                                        this.dos.foto = base64Encode(imageBytes);
                                        ApiServices().createDosWithFoto(this.dos, _imageFile, _imageFile.path).then((isSuccess){
                                          setState(() => _isLoading = false);
                                          if (isSuccess){
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
                                      child: Text('Tidak'),
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
                                fontWeight: fontWeight.bold
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                _isLoading
                    ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
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
          )
      ),
    );
  }
}