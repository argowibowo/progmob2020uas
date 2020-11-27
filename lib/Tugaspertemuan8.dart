import 'package:fluter_hello_world/Preference.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Tugaspertemuan8 extends StatefulWidget {
  Tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Tugaspertemuan8State createState() => _Tugaspertemuan8State();
}

class _Tugaspertemuan8State extends State<Tugaspertemuan8> {
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
        title: Text("Tugas Pertemuan 8 Alfina"),
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
                        Icons.account_circle_outlined,
                        color: Colors.purpleAccent,
                      ),
                      labelText: 'Masukkan Nama',
                      hintText: 'contoh: alfina febri pratama',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: Validate,
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed:() async{
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("Is_login", 0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login(title: "PROGMOB 2020",)),
                      );
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}