import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_72180200/home_view.dart';
import 'package:flutter_72180200/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget{
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{
  //definisi awal variabel isLoginProgmob, default awalnya nol (blm login)
  int isLoginProgmob = 0;

  //utk animasi berubah ukuran
  var isChanged = false;
  //nilai awal sblm diubah ukuran
  double _height = 200;
  double _width = 200;

  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 1);
    Timer(duration, () {
      startSplashScreen();
      setState(() {
        if(_height != 400)
          _height = _height + 50;
        if(_width != 400)
          _width = _width + 50;
      });
    });
  }

  startSplashScreen() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoginProgmob = pref.getInt("is_login_progmob");
    var duration = const Duration(seconds: 1);
    Timer(duration, () {
      //navigasi login
      if(isLoginProgmob == 1){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage(title: "Home Page Progmob 2020",)),
        );
      } else if(isLoginProgmob == 0){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer (
              duration: Duration(seconds: 4),
              curve: Curves.elasticOut,
              width: _width,
              height: _height,
              child: Image.asset(
                "images/logo_progmob.png",
                width: _width,
                height: _height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}