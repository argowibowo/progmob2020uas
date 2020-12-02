import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/dashboard.dart';
import 'package:flutter_progmob2020/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {

  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {

  void initState(){
    super.initState();
    splashStart();
    navigateLogin();
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => dashboard(title: "DASHBOARD")));
    }
  }

  splashStart() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login(title: "PROGMOB 2020 !",)),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Icon(
              Icons.account_tree_outlined,
              size: 100.0,
              color: Colors.white,
            ),

            SizedBox(height: 24.0,),

            Text("PROGMOB FLUTTER 2020",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}