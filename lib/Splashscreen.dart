import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob/Pref.dart';
import 'package:flutter_progmob/main.dart';
import 'package:flutter_progmob/Pref.dart';

class splashscreen extends StatefulWidget {

  _splashscreen createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen> {

  void initState(){
    super.initState();
    splashStart();
  }

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => preferences(title: "Selamat Datang",)),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "image/deden.png",
          width: 350.0,
          height: 600.0,
        )
      ),
    );
  }
}