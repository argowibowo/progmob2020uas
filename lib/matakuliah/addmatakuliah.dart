import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/apiservices.dart';
import 'package:progmob2020_flutter/model.dart';
import 'dart:convert';
import 'dart:io';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();
class AddMatakuliah extends StatefulWidget {
  AddMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddMatakuliahState createState() => new _AddMatakuliahState(title);
}

class _AddMatakuliahState extends State<AddMatakuliah> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddMatakuliahState(this.title);
  Matakuliah matkul = new Matakuliah();
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                            labelText: "Kode",
                            hintText: "Kode Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String value){
                            this.matkul.kode = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nama",
                            hintText: "Nama Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String value){
                            this.matkul.nama = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Hari",
                            hintText: "Hari",
                          ),
                          onSaved: (String value){
                            this.matkul.hari=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Sesi",
                            hintText: "Sesi Matakuliah",
                          ),
                          onSaved: (String value){
                            this.matkul.sesi=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "SKS",
                            hintText: "SKS Matakuliah",
                          ),
                          onSaved: (String value){
                            this.matkul.sks = value;
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
                                  content: Text(" Apakah Yakin untuk disimpan?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.matkul.nim_progmob = "72180210";
                                        setState(() => _isLoading = true);
                                        ApiServices().createMatakuliah(this.matkul).then((isSuccess){
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
