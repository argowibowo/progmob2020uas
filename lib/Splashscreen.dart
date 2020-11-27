import 'dart:async';
import 'package:fluter_hello_world/Preference.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {

  void initState(){
    super.initState();
    splashStart();
  }

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login(title: "Welcome !",)),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Icon(
              Icons.style,
              size: 100.0,
              color: Colors.white,
            ),

            SizedBox(height: 24.0,),

            Text("FINA DISINI!",
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