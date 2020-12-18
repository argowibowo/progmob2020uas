import 'package:flutter/material.dart';
import 'package:flutter_2020/PageLogin.dart';
import 'package:splashscreen/Splashscreen.dart';

class splshscrn extends StatefulWidget {
  @override
  _splshscrnState createState() => _splshscrnState();
}

class _splshscrnState extends State<splshscrn> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.yellowAccent,
      image: Image.asset('assets/kmpus.gif'),
      photoSize: 160.0,
      navigateAfterSeconds: PageLogin(title: 'TUGAS AKHIR SEMESTER',),
    );
  }
}
