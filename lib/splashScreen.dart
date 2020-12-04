import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/home'));
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Image.asset('assets/Anggopi.jpeg', height: 200.0,),

        SizedBox(height: 30.0),

        SpinKitSquareCircle(color: Colors.deepOrange,)
      ],
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}}