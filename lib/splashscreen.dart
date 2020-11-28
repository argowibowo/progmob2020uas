import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app_1/main.dart';
import 'package:flutter_app_1/tugaspertemuan8.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }
  startSplashScreen() async {
    var duration = const Duration(seconds:  3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return MyHomePage(title:"Login");
        }),
      );
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xff329cef),
        body : Center (
          child: Image.asset(
            "images/evos.png",
            width : 200.0,
            height: 100.0,
          )
        ),
    );
  }
}



