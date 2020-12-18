import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/apiservices.dart';
import 'package:flutter_progmob/model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateJadwal extends StatefulWidget {
  final String title;
  Jadwal jdl;
  String idjadwalcari;

  UpdateJadwal({Key key, @required this.title, @required this.jdl, @required this.idjadwalcari}) : super(key: key);

  @override
  _UpdateJadwalState createState() => _UpdateJadwalState(title, jdl, idjadwalcari);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String idjadwalcari;
 Jadwal jdl;
  bool _isLoading = false;
  File _imageFile;

  _UpdateJadwalState(this.title, this.jdl, this.idjadwalcari);

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
                        labelText: "ID",
                        hintText: "ID",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      initialValue: this.jdl.idjadwal,
                      onSaved: (String value){
                        this.jdl.idjadwal = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Matkul",
                        hintText: "Mata Kuliah",
                      ),
                      initialValue: this.jdl.matkul,
                      onSaved: (String value){
                        this.jdl.matkul = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "Dosen",
                        hintText: "Nama Dosen",
                      ),
                      initialValue: this.jdl.dosen,
                      onSaved: (String value){
                        this.jdl.dosen = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "NIDN",
                        hintText: "NIDN",
                      ),
                      initialValue: this.jdl.nidn,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value){
                        this.jdl.nidn = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    (_imageFile == null && this.jdl.foto == null)
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
                      this.jdl.foto,
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
                                    this.jdl.nim_progmob = "72180266";
                                    ApiServices().updateJadwalWithFoto(this.jdl, _imageFile, idjadwalcari).then((isSucces) {
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