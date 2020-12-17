import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/mahasiswa/dashboardmahasiswa.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();
class AddMahasiswa extends StatefulWidget {
  AddMahasiswa({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddMahasiswaState createState() => _AddMahasiswaState(title);
}

class _AddMahasiswaState extends State<AddMahasiswa> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddMahasiswaState(this.title);
  bool _isLoading = false;
  Mahasiswa mhs = new Mahasiswa();
  File  _imageFile;

  //Memilih Image dari galeri
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
        child: SingleChildScrollView( //untuk menghindari tombol tertutup
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
                          hintText: "Nama Mahasiswa",
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
                          hintText: "Alamat Mahasiswa",
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
                          hintText: "Email Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value){
                          this.mhs.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //ternary operation, objek => ? = true, : = false/else
                      _imageFile == null
                          ? Text("Silahkan upload foto terlebih dahulu")
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
                        color: Colors.purpleAccent,
                        onPressed: (){
                          _pickImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.image_rounded,
                              color: Colors.white,),
                            Text("Upload Foto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
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
                          color: Colors.purpleAccent,
                          onPressed: (){
                            return showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Simpan"),
                                    content: Text("Apakah yakin untuk disimpan?"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () async{
                                        _formState.currentState.save();
                                        setState(() => _isLoading = true);
                                        this.mhs.nim_progmob = "72180255";
                                        //List<int> imageBytes = _imageFile.readAsBytesSync();
                                        //this.mhs.foto = base64Encode(imageBytes);
                                        ApiServices().createMhsWithFoto(this.mhs, _imageFile, _imageFile.path).then((isSuccess){
                                          setState(() => _isLoading = false);
                                          if(isSuccess){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }else{
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
                                      ),
                                    ],
                                  );
                                },
                            );
                          },
                        child: Text("Simpan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
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
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.blueGrey,
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
