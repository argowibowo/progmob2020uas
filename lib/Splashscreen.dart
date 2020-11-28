import 'dart:async';

import 'package:flutter_keren/material.dart';
import 'package:flutter_keren/login.dart';
import 'package:flutter_keren/main.dart';
import 'package:flutter_keren/login.dart';


class Splashscreen extends StatefulWidget {

  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {

  void initState(){
    super.initState();
    splashStart();
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
      backgroundColor: Colors.redAccent,
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