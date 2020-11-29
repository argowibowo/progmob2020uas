import 'package:flutter/material.dart';
import 'package:flutter_app_72180256/TugasPertemuan08.dart.';
import 'dart:async';

import 'package:flutter_app_72180256/main.dart';

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
          return  MyHomePage(title:"Login");
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
          "images/Hakkel.png",
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}