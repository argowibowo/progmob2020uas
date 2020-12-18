import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/apiservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddJadwal extends StatefulWidget {
  final String title;
  final String id;

  AddJadwal({Key key, @required this.title, @required this.id}) : super(key: key);

  @override
  _AddJadwalState createState() => new _AddJadwalState(title, id);
}

class _AddJadwalState extends State<AddJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String id;
  _AddJadwalState(this.title, this.id);
  bool _isLoading = false;
  String id_dosen;
  String id_matkul;
  String _baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  List<dynamic> iddosen = new List();
  void getDsn() async{
    final response = await client.get(_baseUrl + "api/progmob/dosen/72180184");
    var listDatadosen = jsonDecode(response.body);
    setState(() {
      iddosen = listDatadosen;
    });
  }

  List<dynamic> idmatkul = new List();
  void getMtkl() async{
    final response = await client.get(_baseUrl + "api/progmob/matkul/72180184");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      id_matkul = listDataMatkul;
    });
  }

  @override
  void initState() {
    super.initState();
    getDsn();
    getMtkl();
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
                      DropdownButton(
                        hint: Text("Select"),
                        value: id_dosen,
                        items: iddosen.map((item){
                          return DropdownMenuItem(
                            child: Text(item['nama']),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            id_dosen = value;
                          });
                        },
                      ),
                      DropdownButton(
                        hint: Text("Select"),
                        value: id_matkul,
                        items: idmatkul.map((item){
                          return DropdownMenuItem(
                            child: Text(item['nama']),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            id_matkul= value;
                          });
                        },
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.red,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Save Data"),
                                content: Text(
                                    "Pastikan data yang di isi sudah benar!"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => _isLoading = true);
                                      ApiServices()
                                      .createJadwal(this.id_dosen, this.id_matkul)
                                      .then((isSuccess){
                                        setState(() => _isLoading = false);
                                          if (isSuccess){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                        } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                        }
                                        });
                                    },
                                    child: Text('Yes'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
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
                    ?Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.5,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.lightGreenAccent,
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

