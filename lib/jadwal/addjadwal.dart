import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:wil_app/model.dart';
import 'package:wil_app/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Login.dart';
import 'package:image_picker/image_picker.dart';


final GlobalKey<ScaffoldState> _scaffoldsate = GlobalKey<ScaffoldState>();

class AddJadwal extends StatefulWidget {
  AddJadwal({Key key, @required  this.title}) : super(key: key);

  final String title;

  @override
  _AddJadwalState createState() => new _AddJadwalState(title);
}

class _AddJadwalState extends State<AddJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddJadwalState(this.title);
  bool _isLoading = false;
  Jadwal jd = new Jadwal();
  File _imageFile;


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
          child : SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget> [
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
                      onSaved: (String value){
                        this.jd.id = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kode ",
                        hintText: "Kode Matkul",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.jd.matkul = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Dosen",
                        hintText: "Kode Dosen",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.jd.dosen = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nidn ",
                        hintText: "Nidn",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),

                      onSaved: (String value){
                        this.jd.nidn = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari ",
                        hintText: "Hari",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),

                      onSaved: (String value){
                        this.jd.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi ",
                        hintText: "Sesi",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),

                      onSaved: (String value){
                        this.jd.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "sks ",
                        hintText: "sks",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),

                      onSaved: (String value){
                        this.jd.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),



                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: (){
                        return showDialog(
                            context : context,
                          builder: (context){
                          return AlertDialog(
                              title: Text("Simpan Data"),
                            content: Text("Apakah ingin menyimpan data ini?"),
                            actions: <Widget>[
                              // FlatButton(
                              //   onPressed: () async{
                              //     _formState.currentState.save();
                              //     setState(() => _isLoading = true);
                              //     this.jd.nim_progmob = "72180230";
                              //
                              //     ApiServices().createJadwal(this.jd).then((isSuccess) {
                              //       setState(() => _isLoading = false);
                              //       if(isSuccess){
                              //         Navigator.pop(context);
                              //         Navigator.pop(context);
                              //       }else{
                              //         Navigator.pop(context);
                              //         Navigator.pop(context);
                              //       }
                              //     });
                              //   },
                              //   child: Text('Ya'),
                              //
                              // ),

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
                        color : Colors.white,
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
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color : Colors.grey,
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
