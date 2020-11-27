import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/splashLogin.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return SplashLogin();
        }),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
        child: Image.asset(
          "images/logo2.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}

