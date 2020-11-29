import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/login.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return Login();
        }),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Image.asset(
        "images/splash1.png",
        width: 200,
        height: 200,
      ),
    )
    );
  }
}