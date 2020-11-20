import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/home_view.dart';
import 'package:flutter_72180200/main.dart';
import 'package:flutter_72180200/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  Login({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with Validation{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Center(
        child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,5),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        icon: Icon(
                          Icons.people,
                          color: Color(0xFF0D47A1),
                        ),
                        labelText: "NIM",
                        hintText: "Contoh: 72180200",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,5),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xFF0D47A1),
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        )
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
                    "Login",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login_progmob", 1);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(title: "Home Page Progmob 2020",)),
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