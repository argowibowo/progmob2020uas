import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/home.dart';
import 'package:flutter_progmob_2020/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key,  title}) : super (key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{
  startSplashScreen() async{
    var duration = const Duration(seconds: 2);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return Home(title: "Home");
          })
        );
      });
    }else{
      return Timer(duration,(){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return Login(title: "Login",);
          })
        );
      });
    }
  }
  double _height = 600;
  double _width = 400;

  @override
  void initState(){
    super.initState();
    var duration = const Duration(seconds: 2);
    Timer(duration,(){
      startSplashScreen();
      setState(() {
        if(_height != 800)
          _height = _height + 100;
        if(_width != 800)
          _width = _width + 100;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,
                child: Image.asset("images/logo2.png",
                width: _width,
                height: _height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}