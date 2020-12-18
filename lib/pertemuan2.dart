import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan2 extends StatefulWidget {
  Pertemuan2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Pertemuan2State createState() => _Pertemuan2State();
}

class _Pertemuan2State extends State<Pertemuan2> {
 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
    
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value){
                    if(value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.people),
                    labelText: "Nama Lengkap",
                    hintText: "contoh: Albertus c.p",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){}
                  },
                  color: Colors.blue,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    // login = 1; logout = 0
                    await pref.setInt("is_login", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  Login(title: "Login Page",)),

                    );
                  },
                  color: Colors.blue,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        )
 
    );
  }
}