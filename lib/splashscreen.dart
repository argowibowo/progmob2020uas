import 'package:flutter/material.dart';
import 'package:flutter_app_2020/home.dart';
import 'package:flutter_app_2020/login.dart';
import 'package:flutter_app_2020/tugaspertemuan8.dart';
import 'dart:async';
import 'package:flutter_app_2020/main.dart';

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
          return Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A),
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 800.0,
          height: 700.0,
        ),
      ),
    );
  }
}