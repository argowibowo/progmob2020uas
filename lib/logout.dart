import 'package:flutter/material.dart';
import 'package:progmob_flutter/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              color: Colors.deepOrange,
              child: Text(
                  'LOGOUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt('is_login', 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(title: "Halaman Login",)),
                );
              }
          )
        ],
      ),
    );
  }
}