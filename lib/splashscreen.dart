import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/Pertemuan8.dart';
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
    var duration = const Duration(seconds: 5);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = pref.getInt("is_login");
    if(login == 0){
      return Timer(duration, ()
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Login(title: "Gas Push")));
      });
    }else{
      return Timer(duration, (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Pertemuan8(title: "Gas Push")));
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Image.asset("images/bennet.png",
            width: 200,
            height: 200,),
        )
    );
  }
}
