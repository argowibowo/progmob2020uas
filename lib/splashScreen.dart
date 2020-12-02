import 'package:andre_fapp/login.dart';
import 'package:flutter/material.dart';
//import 'package:andre_fapp/Home.dart';
import 'package:andre_fapp/TugasPertemuan8.dart';
import 'dart:async';

import 'package:andre_fapp/main.dart';

class SplashScreen extends StatefulWidget {

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
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context) .pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Login(title:'Login');
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2196F3),
      body: Center(
        child: Image.asset(
          "images/baostudio.png",
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}