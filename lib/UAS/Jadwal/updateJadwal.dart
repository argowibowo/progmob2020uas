import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class updateJdwl extends StatefulWidget {
  final String title;
  final String id;
  updateJdwl({Key key, @required this.title,@required this.id}) : super(key: key);
  @override
  _updateJdwlState createState() => _updateJdwlState(title,id);
}

class _updateJdwlState extends State<updateJdwl> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String id;
  _updateJdwlState(this.title,this.id);
  bool _isLoading = false;
  String id_dosen;
  String id_matkul;
  ////////////////////////////////////
  String _baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();
  String _valdos;
  List<dynamic> _datados = new List();
  void getDos() async {
    final response = await client.get(_baseUrl + "/api/progmob/dosen/72180186");
    var listDatados = jsonDecode(response.body);
    setState(() {
      _datados = listDatados;
    });

  }
  String _valmtk;
  List<dynamic> _datamtk = new List();
  void getMtk() async {
    final response = await client.get(_baseUrl + "/api/progmob/matkul/72180186");
    var listDatamtk = jsonDecode(response.body);
    setState(() {
      _datamtk = listDatamtk;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDos();
    getMtk();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(this.title)
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
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama Dosen'
                      ),
                    ),
                    DropdownButton(
                      hint: Text("select"),
                      value: _valdos,
                      items: _datados.map((item){
                        return DropdownMenuItem(
                          child: Text(item['nama']),
                          value: item['id'],
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          _valdos = value;
                        });
                      },

                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama Matakuliah'
                      ),
                    ),
                    DropdownButton(
                      hint: Text("select"),
                      value: _valmtk,
                      items: _datamtk.map((item){
                        return DropdownMenuItem(
                          child: Text(item['nama']),
                          value: item['id'],
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          _valmtk = value;
                        });
                      },

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    /*TextFormField(
                      decoration: InputDecoration(
                        labelText: "id_dosen",
                        hintText: "id_dosen",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value) {
                        this.id_dosen = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(),
                        labelText: "id_matkul",
                        hintText: "id_matkul",
                      ),
                      onSaved: (String value) {
                        this.id_matkul = value;
                      },
                    ),*/
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("simpan"),
                              content: Text("apakah akan di simpan"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      ApiServices()
                                          .updateJadwal(this.id,this._valdos,this._valmtk)
                                          .then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("ya")
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("no")
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text("simpan",
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
                  Opacity(
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
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
