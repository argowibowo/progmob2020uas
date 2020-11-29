import 'dart:async';

import 'package:flutter/material.dart';
import 'package:baru1/main.dart';
import 'package:baru1/Login.dart';
//import 'package:baru1/tugaspertemuan8.dart';
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

  startSplashScreen() async {
    var duration = const Duration(seconds: 6);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = pref.getInt("is_login");
    if(login == 0){
      return Timer(duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)));
      });
    }else {
      return Timer(duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login(title: "Hello Push",)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/bg.png",
              width: 200,
              height: 200,
            ),
            Text(
              "Burger King",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
