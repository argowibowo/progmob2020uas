import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/apiservices.dart';
import 'package:flutter_progmob2020/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class AddMtk extends StatefulWidget{
  final String title;

  AddMtk({Key key, @required this.title}) : super(key: key);

  @override
  _AddMtkState createState() => new _AddMtkState(title);
}

class _AddMtkState extends State<AddMtk>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  String hariState = "Senin";
  _AddMtkState(this.title);
  bool _isLoading = false;
  MataKuliah mtk = new MataKuliah();

  void hariIndo(String hari) {
    switch(hari) {
      case "Senin":
        this.mtk.hari = 1;
        break;
      case "Selasa":
        this.mtk.hari = 2;
        break;
      case "Rabu":
        this.mtk.hari = 3;
        break;
      case "Kamis":
        this.mtk.hari = 4;
        break;
      case "Jumat":
        this.mtk.hari = 5;
        break;
      case "Sabtu":
        this.mtk.hari = 6;
        break;
      case "Minggu":
        this.mtk.hari = 7;
        break;
      default:
        this.mtk.hari = 99;
        break;

    }
  }

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
                            this.mtk.kode = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Nama",
                            hintText: "Nama Matakuliah",
                          ),
                          onSaved: (String value){
                            this.mtk.nama=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: hariState,
                                hint: new Text("Hari"),
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.grey),
                                underline: Container(
                                  height: 1,
                                  color: Colors.pinkAccent,
                                ),
                                onChanged: (String newValue) {
                                  hariIndo(newValue);
                                  setState(() {
                                    hariState = newValue;
                                  });
                                },
                                items: <String>["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
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
                            this.mtk.sesi=int.parse(value);
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
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.mtk.sks = int.parse(value);
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
                                  content: Text(" Yakin Melakukan Penyimpanan?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.mtk.nim_progmob = "72170163";
                                        setState(() => _isLoading = true);
                                        ApiServices().createMtk(this.mtk).then((isSuccess){
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