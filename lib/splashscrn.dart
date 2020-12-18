import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/PageLogin.dart';
import 'package:splashscreen/splashscreen.dart';

class splashscrn extends StatefulWidget {
  @override
  _splashscrnState createState() => _splashscrnState();
}

class _splashscrnState extends State<splashscrn> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.greenAccent,
      image: Image.asset('assets/education.gif'),
      photoSize: 150.0,
      navigateAfterSeconds: PageLogin(title: 'Tugas Akhir Semester',),
    );
  }
}
