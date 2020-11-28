import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_progmob2020/TugasPertemuan9/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.blueAccent,
                onPressed: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => login(title: "Login"))
                  );
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}