import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progmob_setelah_uts_72180190/validation.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class UpdateJadwal extends StatefulWidget {
  final String title;
  Jadwal jadwal;
  String id;

  UpdateJadwal(
      {Key key, @required this.title, @required this.jadwal, @required this.id})
      : super(key: key);

  @override
  _UpdateJadwalState createState() => new _UpdateJadwalState(title, jadwal, id);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String id;
  Jadwal jadwal;
  bool _isLoading = false;

  String _valDosen;
  List<dynamic> lDosen = new List();

  String _valMatkul;
  List<dynamic> lMatkul = new List();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  void getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180190");
    var listDataDosen = jsonDecode(response.body);
    setState(() {
      lDosen = listDataDosen;
    });
    //print("data : $listDataDosen");
  }

  void getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180190");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      lMatkul = listDataMatkul;
    });
    //print("data : $listDataMatkul");
  }

  @override
  void initState() {
    super.initState();
    getMatkul();
    getDosen();
  }

  String validateDosen(String value) {
    if (value.isEmpty) {
      return 'Dosen Harus Dipilih !!!';
    }
    return null;
  }

  String validateMatkul(String value) {
    if (value.isEmpty) {
      return 'Matakuliah Harus Dipilih !!!';
    }
    return null;
  }

  _UpdateJadwalState(this.title, this.jadwal, this.id);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    //kasih jarak antar textformfield
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      hint: Text(
                        "Pilih Dosen",
                        style: TextStyle(
                          fontSize: 13.0,
                          height: 1,
                          color: Colors.cyan,
                        ),
                      ),
                      elevation: 2,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.cyan,
                      ),
                      value: _valDosen,
                      items: lDosen.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item['nama'] + " - " + "NIDN " + item['nidn'],
                            style: TextStyle(
                              fontSize: 13.0,
                              height: 1,
                              color: Colors.cyan,
                            ),
                          ),
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
                        //print(this.jadwal.id_dosen);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide: new BorderSide(color: Colors.cyan),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        enabledBorder: new OutlineInputBorder(
                          //utk ganti warna border di textinputnya
                          borderSide:
                              new BorderSide(color: Colors.cyan, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (_valDosen == null) {
                          return "Mohon Pilih Dosen Yang Diinginkan!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    //kasih jarak antar textformfield
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      hint: Text(
                        "Pilih Matakuliah",
                        style: TextStyle(
                          fontSize: 13.0,
                          height: 1,
                          color: Colors.cyan,
                        ),
                      ),
                      elevation: 2,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.cyan,
                      ),
                      value: _valMatkul,
                      items: lMatkul.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item['nama'] +
                                " - " +
                                "Hari " +
                                item['hari'] +
                                ", " +
                                "Sesi " +
                                item['sesi'] +
                                ", " +
                                "SKS " +
                                item['sks'],
                            style: TextStyle(
                              fontSize: 13.0,
                              height: 1,
                              color: Colors.cyan,
                            ),
                          ),
                          value: item['id'], //id matkul yang diambil valuenya
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
                          borderSide: new BorderSide(color: Colors.cyan),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        enabledBorder: new OutlineInputBorder(
                          //utk ganti warna border di textinputnya
                          borderSide:
                              new BorderSide(color: Colors.cyan, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (_valMatkul == null) {
                          return "Mohon Pilih Matakuliah Yang Diinginkan!";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    //kasih jarak antar textformfield
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    color: Colors.cyan,
                    onPressed: () {
                      if (_formState.currentState.validate()) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Update Data"),
                              content:
                                  Text("Apakah Anda Yakin Dengan Data Anda?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak"),
                                ),
                                FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => _isLoading = true);
                                    this.jadwal.nim_progmob = "72180190";
                                    ApiServices()
                                        .updateJadwal(this.jadwal, id)
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
                              ],
                            );
                          },
                        );
                      } else {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Data Kosong!"),
                              content:
                                  Text("Harap Mengisi Semua Form Yang Ada!"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Keluar"),
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
          ),
        ),
      ),
    );
  }
}
