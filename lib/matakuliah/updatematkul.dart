import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class UpdateMatkul extends StatefulWidget{
  final String title;
  Matkul mk;
  String kodecari;

  UpdateMatkul({Key key,@required this.title, @required this.mk, @required this.kodecari}) : super(key: key);

  @override
  _UpdateMatkulState createState() => _UpdateMatkulState(title, mk, kodecari);
}

class _UpdateMatkulState extends State<UpdateMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  Matkul mk;
  bool _isLoading = false;

  _UpdateMatkulState(this.title, this.mk, this.kodecari);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView( //biar tombol gk ketutup keyboard
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox( //kasih jarak antar textformfield
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD NIM
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kode",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        hintText: "Kode Matakuliah",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        focusColor: Color(0xFF0D47A1),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                          borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      initialValue: this.mk.kode,
                      onSaved: (String value){
                        this.mk.kode = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD NAMA
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        hintText: "Nama Matakuliah",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        focusColor: Color(0xFF0D47A1),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                          borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      initialValue: this.mk.nama,
                      onSaved: (String value){
                        this.mk.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD ALAMAT
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        hintText: "Hari Matakuliah",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        focusColor: Color(0xFF0D47A1),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                          borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      initialValue: this.mk.hari,
                      keyboardType: TextInputType.number,
                      onSaved: (String value){
                        this.mk.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD EMAIL
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        hintText: "Sesi Matakuliah",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        focusColor: Color(0xFF0D47A1),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                          borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      initialValue: this.mk.sesi,
                      keyboardType: TextInputType.number,
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
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        hintText: "SKS Matakuliah",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          height: 1,
                          color: Color(0xFF0D47A1),
                        ),
                        focusColor: Color(0xFF0D47A1),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                          borderSide: new BorderSide(color: Color(0xFF0D47A1)),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Color(0xFF0D47A1), width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                          borderSide: new BorderSide(color: Colors.green, width: 2.0),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      initialValue: this.mk.sks,
                      keyboardType: TextInputType.number,
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
                      color: Colors.green,
                      onPressed: (){
                        return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(
                                  "Ubah Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF0D47A1),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                content: Text(
                                  "Apakah Anda akan menyimpan perubahan data ini?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async{
                                      _formState.currentState.save();
                                      setState(() =>_isLoading = true);
                                      this.mk.nim_progmob = "72180200";
                                      ApiServices().updateMatkul(this.mk, kodecari).then((isSuccess) {
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
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Tidak",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold
                                      ),
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
                  /*Opacity(
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.grey,
                    ),
                  ),*/
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                      backgroundColor: Colors.grey,
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