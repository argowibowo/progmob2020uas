import 'package:flutter/material.dart';
import 'dart:ffi';

class Tugas8 extends StatefulWidget {
  Tugas8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Tugas8State createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
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
        padding:EdgeInsets.all(10.0),
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
                        Icons.account_box_outlined,
                        color: Colors.black,
                      ),
                      labelText: 'Nama Lengkap',
                      hintText: 'Contoh : Deden Prasetio',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: Validate,
                    child: Text(
                      "Submit",
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