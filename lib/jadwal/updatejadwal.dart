import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/model.dart';
import 'package:http/http.dart' show Client;

class UpdateJadwal extends StatefulWidget {
  // final String title;
  // Jadwal jadwal;
  // String id, id_dosen, id_matkul;
  //
  // UpdateJadwal({Key key, @required this.title, @required this.jadwal, @required this.id,
  //   @required this.id_dosen, @required this.id_matkul}) : super(key: key);
  final String title;
  Jadwal jadwal;
  String id;

  UpdateJadwal({Key key, @required this.title, @required this.jadwal, @required this.id}) : super(key: key);

  // @override
  // _UpdateJadwalState createState() => _UpdateJadwalState(title, jadwal, id, id_dosen, id_matkul);
  @override
  _UpdateJadwalState createState() => _UpdateJadwalState(title, jadwal, id);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  // final String id, id_dosen, id_matkul;
  final String id;
  bool isLoading = false;
  Jadwal jadwal = new Jadwal();

  // _UpdateJadwalState(this.title, this.jadwal, this.id, this.id_dosen, this.id_matkul);
  _UpdateJadwalState(this.title, this.jadwal, this.id);

  String dosen;
  Dosen dosen2 = new Dosen();
  List<dynamic> listDosen = new List();

  String matkul;
  List<dynamic> listMatkul = new List();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();
  String selectedMatkul, selectedDosen;

  void getDosen() async {
    final response = await client.get("$baseUrl/api/progmob/dosen/72180180");
    var listDataDosen = jsonDecode(response.body);
    setState(() {
      listDosen = listDataDosen;
      // selectedDosen = listDosen.first.id_dosen;
    });
    // print("data : $listDataDosen");
  }

  void getMatkul() async {
    final response = await client.get("$baseUrl/api/progmob/matkul/72180180");
    var listDataMatkul = jsonDecode(response.body);
    setState(() {
      listMatkul = listDataMatkul;
      // selectedMatkul = listMatkul.first.id_matkul;
    });
    // print("data : $listDataMatkul");
  }

  String getIdMatkul() {
    for (var i in listMatkul){
      if(i["nama"] == jadwal.nama_matkul){
        return i["id"];
      }
    }
  }

  String getIdDosen() {
    for (var i in listDosen){
      if(i["nama"] == jadwal.nama_dosen){
        return i["id"];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMatkul();
    getDosen();
    // selectedMatkul; selectedDosen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

        body: Form(
          key: _formState,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // new Text(
                //   "Silahkan update kedua field di bawah ini"
                // ),
                // SizedBox(height: 15,),
                new Container(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: DropdownButtonFormField(
                    hint: Text("Pilih Matakuliah"),
                    isExpanded: true,
                    // value: matkul,
                    value: getIdMatkul(),
                    // value: selectedMatkul,
                    items: listMatkul.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['nama'] + ' - Hari ' + item['hari']  + ' - Sesi ' + item['sesi']),
                        value: item['id'],
                        // value: getIdMatkul(),
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        matkul = value;
                      });
                    },
                    // onTap: () {
                    //   // print(matkul);
                    //   print(getIdMatkul());
                    // },
                    onSaved: (value){
                      // this.jadwal.id_matkul = _valMatkul;
                      this.jadwal.id_matkul = value;
                      // print(value);
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                new Container(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: DropdownButtonFormField(
                    hint: Text("Pilih Dosen"),
                    isExpanded: true,
                    // value: dosen,
                    value: getIdDosen(),
                    // value: selectedDosen,
                    items: listDosen.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['nama'] + ", " + item['gelar']),
                        value: item['id'],
                        // value: getIdDosen(),
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        dosen = value;
                      });
                    },
                    // onTap: () {
                    //   // print(matkul);
                    //   print(getIdDosen());
                    // },
                    onSaved: (value){
                      // this.jadwal.id_dosen = _valDosen;
                      this.jadwal.id_dosen = value;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                new Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.all(3),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: new MaterialButton(
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Ubah Data"),
                            content: Text("Apakah Anda akan menyimpan data ini?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () async {
                                    _formState.currentState.save();
                                    setState(() => isLoading = true);
                                    this.jadwal.nim_progmob = "72180180";

                                    ApiServices().updateJadwal(this.jadwal, id).then((isSuccess) {
                                      setState(() => isLoading = false);
                                      if (isSuccess) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        // print("masuk success");
                                      } else {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        // print("masuk else");
                                      }
                                    });
                                  },
                                  child: Text("Ya")
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak")
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Simpan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}