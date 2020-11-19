import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_aftuts/tugaspertemuan8.dart';



class SplashScreenPage extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  startSplashScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return TugasPertemuan8();
          })
      );
    });
  }
  void initState() {
    startSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlue[600],
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Colors.lightBlue[600]),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      "assets/images/logo.png",
//                  width: 500.0,
//                  height: 500.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "\n #Pemrograman Mobile\n \nCopyright by Ken Sanio 72180234\n \n",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
