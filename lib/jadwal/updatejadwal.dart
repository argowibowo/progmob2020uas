import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/apiservice.dart';
import 'package:hello_world_flutter/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class updateJadwal extends StatefulWidget{
  final String title;
  Jadwal jadwal;
  String idJadwal;

  updateJadwal({Key key, @required this.title, @required this.jadwal, @required this.idJadwal}) : super(key: key);

  @override
  _updateJadwalState createState() => _updateJadwalState(title, jadwal, idJadwal);
}

class _updateJadwalState extends State<updateJadwal>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String idJadwal;
  String kodeMatkul;
  Jadwal jadwal;
  bool _isLoading = false;

  _updateJadwalState(this.title, this.jadwal, this.idJadwal);

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
                          initialValue: this.jadwal.nidn,
                          onSaved: (String value){
                            this.jadwal.nidn = value;
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
                          color: Colors.greenAccent,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan Data"),
                                  content: Text(" Apakah anda ingin menyimpan data ini"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.jadwal.nim_progmob = "72180216";
                                        setState(() => _isLoading = true);
                                        ApiServices().updateJadwal(this.jadwal, this.kodeMatkul, idJadwal).then((isSuccess){
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