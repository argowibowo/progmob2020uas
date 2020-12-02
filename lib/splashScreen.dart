import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter72180249/logIn.dart';
import 'package:flutter72180249/main.dart';
import 'package:flutter72180249/TugasPertemuan8.dart';
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
                builder: (context) => LogIn(title: "Halo Push")));
      });
    }else{
      return Timer(duration, (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Halo Push")));
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
