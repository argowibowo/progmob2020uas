import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDosen extends StatefulWidget{
  AddDosen({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _AddDosenState createState()=> _AddDosenState(title);
}

class _AddDosenState extends State<AddDosen>{
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDosenState(this.title);
  bool _isLoading = false;
  Dosen dsn = new Dosen();
  File _imageFile;

  //pilih foto dari gallery camera hp
  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:SingleChildScrollView(
            child: Stack( //karena menyediakan teampilan gambar yg cukup besar
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
                        keyboardType: TextInputType.number,
                        onSaved: (String value){
                          this.dsn.nidn = value;
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
                          this.dsn.nama = value;
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
                          this.dsn.alamat = value;
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
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value){
                          this.dsn.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Gelar",
                          hintText: "Gelar",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        keyboardType: TextInputType.name,
                        onSaved: (String value){
                          this.dsn.gelar = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _imageFile == null
                          ? Text("Pilih Gambar")
                          : Image.file(
                        _imageFile,
                        fit: BoxFit.cover,
                        height : 300.0,
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.greenAccent,
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
                        color: Colors.greenAccent,
                        onPressed: (){
                          return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Simpan data"),
                                content: Text("Apakah anda akan menyimpan data ini?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async{
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      this.dsn.nim_progmob = "72180196";
                                      List<int> imageBytes = _imageFile.readAsBytesSync();
                                      this.dsn.foto = base64Encode(imageBytes);
                                      ApiServices().createDsnWithFoto(this.dsn, _imageFile, _imageFile.path).then((isSuccess){
                                        setState(() => _isLoading = false);
                                        if(isSuccess){
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("Ya"),
                                  ),
                                  FlatButton(
                                    onPressed: (){
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
                          ),),
                      ),
                    ],
                  ),
                ),
                _isLoading
                    ? Stack(
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
                    :Container(),
              ],
            )
        ),
      ),
    );
  }
}
