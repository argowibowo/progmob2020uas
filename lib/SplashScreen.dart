import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/TugasPertemuan8.dart';
import 'dart:async';

import 'package:flutter_app/main.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var w = const Duration(seconds: 5);
    return Timer(w, () {
      Navigator.of(context) .pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Login(title: "Login");
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEECEB),
      body: Center(
        child: Image.asset(
          "images/1.png",
        width: 400.0,
        height: 500.0,
        ),
      ),
    );
  }
}
