import 'package:flutter/material.dart';
import 'package:flutter_app_2020/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child:Form(
            child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: new EdgeInsets.all(0.0),
                    icon: new Icon(Icons.accessibility, size: 50.50),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  IconButton(
                    padding: new EdgeInsets.all(0.0),
                    icon: new Icon(Icons.book, size: 50.50),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  IconButton(
                    padding: new EdgeInsets.all(0.0),
                    icon: new Icon(Icons.phone, size: 50.50),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  IconButton(
                    padding: new EdgeInsets.all(0.0),
                    icon: new Icon(Icons.map, size: 50.50),
                  ),
                  /*RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )*/
                ]
            ),
          )
      ),
    );
  }
}