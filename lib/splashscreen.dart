import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_72180219/main.dart';
import 'package:flutter_72180219/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds:5);
      SharedPreferences pref = await SharedPreferences.getInstance();
      int login = pref.getInt("is_login");
      if (login == 0){
        return Timer (duration, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MyHomePage (title: 'Hallo Push',)));
        });
      }else{
        return Timer (duration, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => tugaspertemuan8 (title: 'tugas pertemuan 8',)));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: AnimatedContainer(
        // Use the properties stored in the State class.
        width: 1000,
        height: 1000,
        // Define how long the animation should take.
        duration: Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.bounceIn,
        child: Image.asset("images/dadu.jpg")
      )
      //body: Center (
        //child: Image.asset("images/icon-app.png",
        //width: 200,
        //height: 200,
    );
  }
}