import 'dart:ffi';
import 'package:flutter/material.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Void Validate(){
    if (key.currentState.validate()){
      print("Validate");
    }
    else {
      print("failed");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Pertemuan 8"),
      ),
      body: Padding(
        padding:EdgeInsets.all(15.0),
        child : Center(
            child : Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Nama Tidak Boleh Kosong";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      icon:Icon (
                        Icons.attach_email,
                        color: Colors.purpleAccent,
                      ),
                      labelText: 'Nama Lengkap',
                      hintText: 'masukkan nama anda disini',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: Validate,
                    child: Text(
                      "SIMPAN",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}