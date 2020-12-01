import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/dashboard.dart';
import 'package:flutter_app_1/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _loginState createState() {
    return _loginState();
  }
}
class _loginState extends State<login> {
  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:(context) => dashboard(title: "DASHBOARD"))
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
                      labelText: 'Username',
                      hintText: 'contoh : dycha',
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
                      labelText: 'Password',
                      hintText: '**********',
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
                        MaterialPageRoute(builder:(context) => dashboard(title: "Dashboard")),
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