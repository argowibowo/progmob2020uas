// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/pertemuan1.dart';
import 'package:progmob_flutter/tugasPertemuan1Widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progmob_flutter/validation.dart';

void main(){
  runApp(MyApp());
}

//stateless : tidak bisa diotak atik.
class MyApp extends StatelessWidget {
  //biar gak kedip2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme:ThemeData(
        //menggambil kelas apa yang nanti digunakan pake home
        primarySwatch : Colors.blue,
        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashLogin(
          title:"Flutter Home Page"
      ),
    );
  }
}

class SplashLogin extends StatefulWidget{
  SplashLogin({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _SplashLoginState createState()=> _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> with Validation{
  String nama = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  int _counter = 0;
  bool _passwordVisible;
  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
//FUNGSI NAVIGATE
  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(title:"Dashboard")),
      );
    }
  }
  @override
  void initState() {
    navigateLogin();
    _passwordVisible = false;
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Form(
         key : formKey,
          child: Column(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              //MEMBUAT TEXT INPUT
              TextFormField(
                  decoration: new InputDecoration(
                    icon: Icon(Icons.people),
                    hintText: "Username",
                    //MEMBUAT BORDER OUTLINE
                    border: OutlineInputBorder(
                    borderRadius : new BorderRadius.circular(32.0),
                    ),
                  ),
                validator: validateUser,
                onSaved: (String value){
                  nama = value;
                },
              ),
              TextFormField(
                obscureText : !_passwordVisible,
                decoration: new InputDecoration(
                  icon: Icon(Icons.security),
                  hintText: "Password",
                  //MEMBUAT BORDER OUTLINE
                  border: OutlineInputBorder(
                    borderRadius : new BorderRadius.circular(32.0),
                  ),
                ),
                validator: validateUser,
                onSaved: (String value){
                  password = value;
                },
              ),
              RaisedButton(
                color: Colors.blue,
                      child: Text(
                          "Login",
                        style: TextStyle(
                          //kasih warna text
                            color: Colors.white
                        ),
                ),
                //------------------PINDAH HALAMAN
                onPressed:() async {
                  if(formKey.currentState.validate()){
                    formKey.currentState.save();
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("isLogin", 1);
                    //push biar ga ada backnya pake push replacement, kalo di back ntar item
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard(title:"Dashboard")),
                    );
                  }
                },
              )
            ]
          ),
        ),
      ]
      ),
    );
  }
}
