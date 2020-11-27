// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/pertemuan1.dart';
import 'package:progmob_flutter/splashLogin.dart';
import 'package:progmob_flutter/tugasPertemuan1Widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        home: MyHomePage(
        title:"Flutter Home Page"
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _MyHomePageState createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(
      context,
        MaterialPageRoute(builder: (context) => SplashLogin(title:"Halo Push")),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo_progmob.png', height: 200.0,),
            SizedBox(height: 30.0),
            SpinKitChasingDots(color: Colors.greenAccent),

          ]
      ),
    );
  }

}


