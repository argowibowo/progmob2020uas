import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_72180200/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Center(
        child: Form(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,15),
                  child: Image.asset(
                    "images/logo_progmob.png",
                    width: 300,
                    height: 300,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,5),
                  child: Text(
                    'Welcome to Progmob 2020!',
                    style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 20
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10)
                ),
                RaisedButton(
                  color: Color(0xFF0D47A1),
                  disabledColor: Color(0xFF0D47A1),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login_progmob", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                    );
                  },
                )
              ]
          ),
        ),

      ),
    );
  }
}