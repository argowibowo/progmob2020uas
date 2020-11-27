import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/splashLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Home Page'),
      ),
      body: Center(
        child: Column( //hanya bisa menambahkan 1 komponen(child) column --> atas ke bawah, row --> kiri ke kanan
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashLogin(title: 'Halaman Login')),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
