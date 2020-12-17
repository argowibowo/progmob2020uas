import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/dashboard.dart';
import 'package:flutter_progmob_app/logIn.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:flutter_progmob_app/tugasPertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }
  startSplashScreen() async{
    var duration = const Duration(seconds: 3);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = pref.getInt("is_login");
    if(login == 0){
      return Timer(duration, ()
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LogIn(title: "Push terus")));
      });
    }else{
      return Timer(duration, (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard(title: "Push terus")));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Image.asset("images/firewall.png",
        width: 200,
        height: 200,),
    )
    );
  }
}
