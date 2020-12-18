import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/dashboard.dart';
import 'package:hello_world_flutter/dashboardbaru.dart';
import 'package:hello_world_flutter/main.dart';
import 'package:hello_world_flutter/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {

  _splash createState() => _splash();
}

class _splash extends State<splash> {

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => preferences(title: "Welcome !",)),

      );
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => dashboard(title: "DASHBOARD")));
    }
  }

  void initState(){
    super.initState();
    splashStart();
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Icon(
              Icons.apartment_outlined,
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
