import 'package:flutter/material.dart';
import 'package:flutter_2020/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_2020/model.dart';
import 'package:image_picker/image_picker.dart';

class  UpdateMhs extends StatefulWidget {
  final String title;
  Mahasiswa mhs;
  String nimcari;

  UpdateMhs({Key key,@required this.title}) : super(key:key);

  @override
  _UpdateMhsState createState()=> new _UpdateMhsState(title, mhs, nimcari);
}

class _UpdateMhsState extends State<UpdateMhs> {
  final GlobalKey<FormState>_formState = GlobalKey<FormState>();
  final String title;
  final String nimcari;
  Mahasiswa mhs ;
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
  Widget build(BuildContext context){
    return new Scaffold(
        appBar:  new AppBar(
          title:  new Text(this.title),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child:Stack(
                children:<Widget> [
                  Form(
                    key: _formState,
                    child: Column()
                    children: <Widget>[
                  SizedBox(
                  height:15 ,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "NIM",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    ),
                    initialValue: this.mhs.nim,
                    onSaved: (String value){
                      this.mhs.nim =value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border:  OutlineInputBorder(),
                      labelText: "Nama",
                      hintText: "Nama Mahasiswa",
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
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border:  OutlineInputBorder(),
                      labelText: "Alamat",
                      hintText: "Alamat Mahasiswa",
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
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border:  OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Email Mahasiswa",
                    ),
                    initialValue: this.mhs.email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value){
                      this.mhs.email = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _imageFile == null
                      ? Text('Silahkan Memilih Gambar Terlebih Dahulu')
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
                    onPressed: (){
                      _pickImage(ImageSource.gallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.image,color:Colors.white,),
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
                  (_imageFile == null && this.mhs.foto == null)
                    ?
                  Text('Silahkan memilih gambar terlebih dahulu')
                    :
                  (_imageFile !=null)
                     ?
                   Image.file(
                     _imageFile,
                     fit: BoxFit.cover,
                     height: 300.0,
                     alignment: Alignment.topCenter,
                     width:  MediaQuery.of(context).size.width,
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
                    color: Colors.blue,
                    onPressed: (){
                      return showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Simpan Data"),
                            content: Text("Apakah Anda akan menyimpan data ini??"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () async {
                                  _formState.currentState.save();
                                  setState(()  => _isLoading = true);
                                  this.mhs.nim_progmob = "72180262";
                                  //List<int> imageBytes = _imageFile.readAsBytesSync();
                                  //this.mhs.foto= base64Encode(imageBytes);
                                  ApiServices().updateMhsWithFoto(this.mhs, _imageFile, nimcari).then((isSuccess)){
                                    setState(() => _isLoading =false);
                                    if (isSucces){
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }else {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  };
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

            _isLoading
                ? Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.lightBlueAccent,
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