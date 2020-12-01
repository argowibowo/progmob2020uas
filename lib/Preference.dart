import 'dart:ffi';
import 'package:fluter_hello_world/Tugaspertemuan8.dart';
import 'package:fluter_hello_world/dashboard.dart';
import 'package:fluter_hello_world/dosen/DashboardDosen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  void navigateLogin() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  int isLogin = pref.getInt("is_login");
  if(isLogin == 1){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard(title: "PROGMOB2020",))
    );
  }
  }

  @override
  void initState() {
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROGMOB 2020"),
      ),
      body: Padding(
        padding:EdgeInsets.all(15.0),
        child : Center(
            child : Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Masukkan Username',
                      hintText: 'contoh: alfina febri pratama',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Masukkan Password',
                      hintText: '******',
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "LOGIN",
                        style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                    onPressed:() async{
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("Is_login", 1);
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard(title: "PROGMOB 2020",)),
                    );
                  },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }


}