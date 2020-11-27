import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setInt("is_login", 0);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          color: Colors.blue,
          child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )
          ),
        ),
      ),
    );
  }
}