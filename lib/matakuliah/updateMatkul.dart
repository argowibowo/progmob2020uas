import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class UpdateMatkul extends StatefulWidget{
  final String title;
  Matkul mtkl;
  String kodecari;

  UpdateMatkul({Key key, @required this.title, @required this.mtkl, @required this.kodecari}) : super(key: key);

  @override
  _UpdateMatakulState createState() => _UpdateMatakulState(title, mtkl, kodecari);
}

class _UpdateMatakulState extends State<UpdateMatkul>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  String hariState;
  Matkul mtkl;
  bool _isLoading = false;

  _UpdateMatakulState(this.title, this.mtkl, this.kodecari);

  String hariIndoToString(int hari) {
    switch(hari) {
      case 1:
        return "Senin";
        break;
      case 2:
        return "Selasa";
        break;
      case 3:
        return "Rabu";
        break;
      case 4:
        return "Kamis";
        break;
      case 5:
        return "Jumat";
        break;
      case 6:
        return "Sabtu";
        break;
      case 7:
        return "Minggu";
        break;
      default:
        return "Hari";
        break;

    }
  }

  void hariIndo(String hari) {
    switch(hari) {
      case "Senin":
        this.mtkl.hari = 1;
        break;
      case "Selasa":
        this.mtkl.hari = 2;
        break;
      case "Rabu":
        this.mtkl.hari = 3;
        break;
      case "Kamis":
        this.mtkl.hari = 4;
        break;
      case "Jumat":
        this.mtkl.hari = 5;
        break;
      case "Sabtu":
        this.mtkl.hari = 6;
        break;
      case "Minggu":
        this.mtkl.hari = 7;
        break;
      default:
        this.mtkl.hari = 99;
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      hariState = hariIndoToString(this.mtkl.hari);
    });
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
                          initialValue: this.mtkl.kode,
                          onSaved: (String value){
                            this.mtkl.kode = value;
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
                          initialValue: this.mtkl.nama,
                          onSaved: (String value){
                            this.mtkl.nama=value;
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
                                  color: Colors.deepOrange,
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
                          initialValue: this.mtkl.sesi.toString(),
                          onSaved: (String value){
                            this.mtkl.sesi=int.parse(value);
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
                          initialValue: this.mtkl.sks.toString(),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.mtkl.sks = int.parse(value);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          color: Colors.deepOrange,
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan Data"),
                                  content: Text(" Apakah anda akan mengubah data ini"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.mtkl.nim_progmob = "72180203";
                                        setState(() => _isLoading = true);
                                        ApiServices().updateMatkul(this.mtkl, kodecari).then((isSuccess){
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