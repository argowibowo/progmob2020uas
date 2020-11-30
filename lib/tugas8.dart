import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/login.dart';
import 'package:flutter_progmob2020/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class tugas8 extends StatefulWidget {
  tugas8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugas8State createState() => _tugas8State();
}

class _tugas8State extends State<tugas8> {
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
        title: Text("Tugas Pertemuan ke-8"),
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
                        Icons.account_circle_rounded,
                        color: Colors.blue,
                      ),
                      labelText: 'Nama Lengkap',
                      hintText: 'Contoh: Kurniadi',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
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
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setInt("isLogin", 0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => login(title: 'Login Page')),
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

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isLogin = prefs.getInt('isLogin');
    if(isLogin == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Halaman Login ')),
      );
    }
  }

  @override
  void initState() {
    checkLogin();
  }
}