import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'dart:async';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/tugaspertemuan8.dart';
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
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  void initState(){
    super.initState();
    splashscreenStart();
    //navigateLogin();
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

            Icon(
              Icons.people,
              size: 120.0,
              color: Colors.white,
            ),

            SizedBox(height: 15.0,),

            Text("FLUTTER 2020",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),

          ],
        ),
      ),
    );
  }

}