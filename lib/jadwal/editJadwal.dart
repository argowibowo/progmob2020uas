import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class EditJadwal extends StatefulWidget {
  final String title;
  final String id;
  Jadwal jadwal;

  EditJadwal(
      {Key key, @required this.title, @required this.id, @required this.jadwal})
      : super(key: key);

  @override
  _EditJadwalState createState() => _EditJadwalState(title, id, jadwal);
}

class _EditJadwalState extends State<EditJadwal> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String id;
  Jadwal jadwal;
  Dosen dsn;
  Matakuliah matkul;

  _EditJadwalState(this.title, this.id, this.jadwal);

  bool _isLoading = false;
  Jadwal jdwl = new Jadwal();

  String _valDosen; //ambil value id dosen
  List<dynamic> listDosen = new List();

  String _valMatkul;
  List<dynamic> listMatkul = new List();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  void getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180196");
    var listDataDosen = jsonDecode(response.body);
    setState(() {
      listDosen = listDataDosen;
    });
  }

  void getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180196");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      listMatkul = listDataMatkul;
    });
  }

  @override
  void initState() {
    super.initState();
    getMatkul();
    getDosen();
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
            child: Stack(
          //karena menyediakan teampilan gambar yg cukup besar
          children: <Widget>[
            Form(
              key: _formState,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      hint: Text(
                        this.jadwal.matkul +
                            " - " +
                            this.jadwal.hari +
                            " - " +
                            this.jadwal.sesi,
                        style: TextStyle(
                          fontSize: 17.0,
                          height: 1,
                          color: Colors.deepPurple[900],
                        ),
                      ),
                      elevation: 2,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.deepPurple[900],
                      ),
                      value: this.jadwal.id_matkul,
                      items: listMatkul.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['nama'] +
                              " - " +
                              item['hari'] +
                              " - " +
                              item['sesi']),
                          value: item['id'], //id dosen yg diambil valuenya
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valMatkul = value;
                        });
                      },
                      onSaved: (value) {
                        this.jadwal.id_matkul = _valMatkul;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide:
                              new BorderSide(color: Colors.deepPurple[900]),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        enabledBorder: new OutlineInputBorder(
                          //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(
                              color: Colors.deepPurple[900], width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (_valMatkul == null) {
                          return "Pilih Matakuliah";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      hint: Text(
                        this.jadwal.dosen,
                        style: TextStyle(
                          fontSize: 17.0,
                          height: 1,
                          color: Colors.deepPurple[900],
                        ),
                      ),
                      elevation: 2,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.deepPurple[900],
                      ),
                      value: this.jadwal.id_dosen,
                      items: listDosen.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['nama'] + ".," + item['gelar']),
                          value: item['id'], //id dosen yg diambil valuenya
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valDosen = value;
                        });
                      },
                      onSaved: (value) {
                        this.jadwal.id_dosen = _valDosen;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide:
                              new BorderSide(color: Colors.deepPurple[900]),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        enabledBorder: new OutlineInputBorder(
                          //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(
                              color: Colors.deepPurple[900], width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (_valDosen == null) {
                          return "Pilih Dosen";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    color: Colors.deepPurpleAccent[100],
                    onPressed: () {
                      if (_formState.currentState.validate()) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan data"),
                              content:
                                  Text("Apakah anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.jadwal.nim_progmob = "72180196";
                                    ApiServices()
                                        .updateJadwal(
                                            this.jadwal, this.jadwal.id)
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
                                  child: Text("Ya"),
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
                      }
                    },
                    child: Text(
                      "Simpan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
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
                : Container(),
          ],
        )),
      ),
    );
  }
}
