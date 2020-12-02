
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
import 'login.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {



  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return Dashboard(title: 'Dasboard');
          }),
        );
      });
    } else {
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return Login(title: "Login Page");
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
      home: Scaffold(
      backgroundColor: (Colors.grey),
      body: Container(
      child: Column(
        children: [
      AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.bounceOut,
      width: _width,
      height: _height,
     child: Image.asset("images/Thalia.png",
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