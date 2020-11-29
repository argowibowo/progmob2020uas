import 'package:flutter/material.dart';
import 'package:flutter_keren/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
              child:Text(
                  'Login'
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt("isLogin", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => tugaspertemuan8(title: 'Home Page')),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isLogin = prefs.getInt('isLogin');
    if(isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => tugaspertemuan8(title: 'Home Page')),
      );
    }
  }

  @override
  void initState() {
    checkLogin();
  }
}