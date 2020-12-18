
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/dashboard.dart';
import 'package:flutter_app_1/login.dart';
import 'package:flutter_app_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {

  _splashscreen createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen> {

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login(title: "PROGMOB UAS !",)),

      );
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => dashboard(title: "DASHBOARD")));
    }
  }

  void initState(){
    super.initState();
    splashStart();
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "images/evos.png",
          width : 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}