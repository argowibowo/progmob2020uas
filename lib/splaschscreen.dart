import 'package:flutter/material.dart';
import 'package:simpelproject/login.dart';
import 'package:splashscreen/splashscreen.dart';

class splaschscreen extends StatefulWidget {
  @override
  splashscrnState createState() => splashscrnState();
}

class splashscrnState extends State<splaschscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.blue,
      image: Image.asset('assets/logoukdw.jpg'),
      photoSize: 150.0,
      navigateAfterSeconds: PageLogin(title: 'Tugas 9',),
    );
  }
}