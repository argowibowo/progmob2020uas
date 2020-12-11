import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class EditMahasiswa extends StatefulWidget{
  final String title;
  Mahasiswa mhs;
  String nimCari;

  EditMahasiswa({
    Key key,
    @required this.title,
    @required this.mhs,
    @required this.nimCari
  }) : super(key: key);

  @override
  _EditMahasiswaState createState()=> _EditMahasiswaState(title, mhs, nimCari);
}

class _EditMahasiswaState extends State<EditMahasiswa>{
  final GlobalKey<FormState> _formState= GlobalKey<FormState>();
  final String title;
  final String nimCari;
  Mahasiswa mhs;
  bool _isLoading = false;
  File _imageFile;

  _EditMahasiswaState(this.title, this.mhs, this.nimCari);

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
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child:SingleChildScrollView(
            child: Stack( //karena menyediakan teampilan gambar yg cukup besar
              children: <Widget>[
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "NIM",
                          hintText: "NIM",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: this.mhs.nim,
                        onSaved: (String value){
                          this.mhs.nim = value;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        initialValue: this.mhs.nama,
                        onSaved: (String value){
                          this.mhs.nama = value;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        initialValue: this.mhs.alamat,
                        onSaved: (String value){
                          this.mhs.alamat = value;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        initialValue: this.mhs.email,
                        onSaved: (String value){
                          this.mhs.email = value;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      (_imageFile == null && this.mhs.foto == null)
                      ?
                          Text("Pilih Gambar")
                      :
                      (_imageFile != null)
                      ?
                          Image.file(
                            _imageFile,
                            fit:BoxFit.cover,
                            height: 300.0,
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                          )
                      :
                          Image.network(
                            this.mhs.foto,
                            fit: BoxFit.cover,
                            height: 300.0,
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
                        height: 15.0,
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
                                      this.mhs.nim_progmob = "72180196";
                                      ApiServices().updateMhsWithFoto(this.mhs, _imageFile, nimCari).then((isSuccess){
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
