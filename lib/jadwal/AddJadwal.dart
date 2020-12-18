import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluter_hello_world/apiservices.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class AddJadwal extends StatefulWidget{
  final String title;

  AddJadwal({Key key, @required this.title}) : super(key: key);

  @override
  _AddJadwalState createState() => new _AddJadwalState(title);
}

class _AddJadwalState extends State<AddJadwal>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddJadwalState(this.title);
  bool _isLoading = false;

  String kodeMatkul;
  String nidnDosen;
  String nimProgmob;

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
                            labelText: "Kode",
                            hintText: "Kode Matakuliah",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onSaved: (String value){
                            this.kodeMatkul = value;
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
                            hintText: "NIDN Dosen",
                          ),
                          onSaved: (String value){
                            this.nidnDosen = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          color: Colors.brown,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan Data"),
                                  content: Text(" Apakah anda akan menyimpan data ini?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.nimProgmob = "72180188";
                                        setState(() => _isLoading = true);
                                        ApiServices().createJadwal(this.kodeMatkul, this.nidnDosen, this.nimProgmob).then((isSuccess){
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
                                color: Colors.brown,
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