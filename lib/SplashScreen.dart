import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/HalamanLogin.dart';
import 'package:flutter_app_1/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_1/SplashScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return HalamanLogin (title: "HalamanLogin");
            })
        );
      });
    } else {
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return Pertemuan8(title: "Login");
            })
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
        body: Center(
            child: Image.asset(
                "images/images2.png",
              width: 100.0,
              height: 100.0,
                ),
              ),
            );

  }
}