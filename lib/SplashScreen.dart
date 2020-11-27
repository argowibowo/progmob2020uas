import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget{

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => NavBar(title: "ProgMob")));
    }
  }

  @override
  void initState(){
    super.initState();
    splashscreenStart();
    navigateLogin();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }

}