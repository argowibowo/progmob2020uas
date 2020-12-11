import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDsn extends StatefulWidget{
  AddDsn({Key key,@required this.title}) : super(key: key);
  final String title;

  @override
  _AddDsnState createState() => _AddDsnState(title);
}

class _AddDsnState extends State<AddDsn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDsnState(this.title);
  bool _isLoading = false;
  Dosen dsn = new Dosen();
  File _imageFile;

  //Untuk pilih gambar via image/gallery
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(this.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView( //biar tombol gk ketutup keyboard
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox( //kasih jarak antar textformfield
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD NIM
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "NIDN",
                        hintText: "NIDN",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
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
                    //UNTUK TEXTFORMFIELD NAMA
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama Dosen",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.dsn.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD ALAMAT
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Alamat",
                        hintText: "Alamat Dosen",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.dsn.alamat = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD EMAIL
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                        hintText: "E-Mail Dosen",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
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
                        hintText: "Gelar Dosen",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.dsn.gelar = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK UPLOAD FOTO
                    //menggunakan ternary operation, fungsinya seperti if-else
                    _imageFile == null
                        ? Text('Silahkan Pilih Gambar Terlebih Dahulu') //kalau trus ternary masuk sini
                        : Image.file( //kalau false (else) ternary masuk sini
                      _imageFile,
                      fit: BoxFit.cover,
                      height: 300.0,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Color(0xFF0D47A1),
                      onPressed: (){
                        _pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          Text(
                            "Upload Foto",
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
                      color: Colors.green,
                      onPressed: (){
                        return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(
                                  "Simpan Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF0D47A1),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                content: Text(
                                  "Apakah Anda akan menyimpan data ini?",
                                  style: TextStyle(
                                    color: Color(0xFF0D47A1),
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async{
                                      _formState.currentState.save();
                                      setState(() =>_isLoading = true);
                                      this.dsn.nim_progmob = "72180200";
                                      //List<int> imageBytes = _imageFile.readAsBytesSync();
                                      //this.mhs.foto = base64Encode(imageBytes);
                                      ApiServices().createDsnWithFoto(this.dsn, _imageFile, _imageFile.path).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess){
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Ya",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Tidak",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      child: Text(
                        "Simpan",
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
                  /*Opacity(
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.grey,
                    ),
                  ),*/
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                      backgroundColor: Colors.grey,
                      strokeWidth: 7,
                    ),
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