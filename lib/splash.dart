import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world_flutter/main.dart';
import 'package:hello_world_flutter/preferences.dart';

class splash extends StatefulWidget {

  _splash createState() => _splash();
}

class _splash extends State<splash> {

  void initState(){
    super.initState();
    splashStart();
  }

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => preferences(title: "Welcome !",)),

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
              Icons.school,
              size: 100.0,
              color: Colors.white,
            ),

            SizedBox(height: 24.0,),

            Text("DUTA WACANA",
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
