import 'package:flutter/material.dart';
import 'package:flutter_72180247/apiservice.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_72180247/model.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMatkul extends StatefulWidget{
  AddMatkul({Key key,@required this.title}) : super(key: key);
  final String title;

  @override
  _AddMatkulState createState() => _AddMatkulState(title);
}

class _AddMatkulState extends State<AddMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddMatkulState(this.title);
  bool _isLoading = false;
  Matakuliah mk = new Matakuliah();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffff4d4d),
      appBar: AppBar(
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
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.kode = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        hintText: "Hari Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      //keyboardType: TextInputType.number,
                      onSaved: (String value){
                        this.mk.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi",
                        hintText: "Sesi Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "SKS",
                        hintText: "SKS Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.red,
                      onPressed: (){
                        return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(
                                  "Simpan Data",
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  "Apakah Anda akan menyimpan data ini?",
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async{
                                      _formState.currentState.save();
                                      setState(() =>_isLoading = true);
                                      this.mk.nim_progmob = "72180247";
                                      ApiServices().createMatkul(this.mk).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess){
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Ya",
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Tidak",

                                    ),
                                  ),
                                ],
                              );
                            }
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
                  ],
                ),
              ),
              _isLoading
                  ? Stack(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      backgroundColor: Colors.red,
                      strokeWidth: 7,
                    ),
                  ),
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