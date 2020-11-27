import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/NavBar.dart';
import 'package:flutter_app/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Void Validate(){
    if (key.currentState.validate()){
      print("Validate");
    }
    else {
      print("failed");
    }
  }

  bool _isHidePassword = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  /*void navigateLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isLogin = prefs.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NavBar(title: "ProgMob",)),
      );
    }
  }

  @override
  void initState() {
    navigateLogin();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key:key,
        child: ListView(
            padding: EdgeInsets.all(16.0),
          children: <Widget>[
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Username Tidak Boleh Kosong";
                  }
                  else{
                    return null;
                  }
                },
                style: TextStyle(
                    fontSize: 18
                ),
                decoration: InputDecoration(
                    icon: Icon(
                        Icons.person,
                        color: Colors.blue
                    ),
                  labelText: "Username"
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Password Tidak Boleh Kosong";
                  }
                  else{
                    return null;
                  }
                },
                style: TextStyle(
                    fontSize: 18
                ),
                obscureText: _isHidePassword,
                decoration: InputDecoration(
                  icon: Icon(
                      Icons.lock_rounded,
                      color: Colors.blue
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isHidePassword ? Icons.visibility_off : Icons.visibility,
                      color:_isHidePassword ? Colors.grey : Colors.blue
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

