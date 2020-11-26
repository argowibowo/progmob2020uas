import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() {
    var duration = const Duration(seconds: 5);
    return Timer(duration,() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Welcome")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Image.asset("images/logopinterest.png",
          width: 200,
          height: 200,
        ),
      )
    );
  }
}