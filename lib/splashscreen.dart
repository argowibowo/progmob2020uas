import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homie.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, String title}) : super(key: key);
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
              return Home(title: "Home");
            })
        );
      });
    } else {
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return Login(title: "Login");
            })
        );
      });
    }
  }

  double _height = 400;
  double _width = 400;

  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      startSplashScreen();
      setState(() {
        if(_height != 600)
          _height = _height + 100;
        if(_width != 600)
          _width = _width + 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.bounceInOut,
                  width: _width,
                  height: _height,
                  child: Image.asset(
                    "images/stillSick.png",
                    width: _width,
                    height: _height,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                ),
              ],
            )
        ),
      ),
    );
  }
}