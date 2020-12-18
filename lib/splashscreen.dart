import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_app/dashbord.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // void navigateLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int isLogin = pref.getInt("is_login");
  //   if(isLogin == 1){
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halaman Utama",)),
  //     );
  //   }
  //   else {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
  //     );
  //   }
  // }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return Dashboard(title: "Dashboard");
            })
        );
      });
    } else {
      return Timer(duration, (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return Login(title: "Login Page");
            })
        );
      });
    }
    // return Timer(duration, (){
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_){
    //         return Login(title: "Login Page");
    //       })
    //   );
    // });
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
        backgroundColor: Colors.cyan,
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                child: Image.asset(
                  "images/logo.png",
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