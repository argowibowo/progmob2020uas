import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/dashboard.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:flutter_progmob_2020/pertemuan1.dart';
import 'package:splashscreen/splashscreen.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.green,
      image: Image.asset('asset/tenor.gif'),
      photoSize: 150.0,
      navigateAfterSeconds: Dashboard(title: '',),
    );
  }
}
