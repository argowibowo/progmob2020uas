import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_kerenkezia/apiservices.dart';
import 'package:flutter_kerenkezia/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class UpdateJdwl extends StatefulWidget{
  final String title;
  Jadwal jdwl;
  String idJdwl;

  UpdateJdwl({Key key, @required this.title, @required this.jdwl, @required this.idJdwl}) : super(key: key);

  @override
  _UpdateJdwlState createState() => _UpdateJdwlState(title, jdwl, idJdwl);
}

class _UpdateJdwlState extends State<UpdateJdwl>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String idJdwl;
  String kodeMatkul;
  Jadwal jdwl;
  bool _isLoading = false;

  _UpdateJdwlState(this.title, this.jdwl, this.idJdwl);

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
                            labelText: "NIDN",
                            hintText: "NIDN Dosen",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          initialValue: this.jdwl.nidn,
                          onSaved: (String value){
                            this.jdwl.nidn = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Kode",
                            hintText: "Kode Matakuliah Baru",
                          ),
                          onSaved: (String value){
                            this.kodeMatkul=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          color: Colors.pinkAccent,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan Data"),
                                  content: Text(" Apakah anda akan menyimpan data ini"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.jdwl.nim_progmob = "72180222";
                                        setState(() => _isLoading = true);
                                        ApiServices().updateJdwl(this.jdwl, this.kodeMatkul, idJdwl).then((isSuccess){
                                          setState(() => _isLoading = false);
                                          if (isSuccess){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else{
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text("Ya"),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text ("Tidak"),
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
                      child:  CircularProgressIndicator(),

                    )
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
