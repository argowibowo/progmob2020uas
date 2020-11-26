import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/loginpage.dart';
import 'package:progmob_setelah_uts_72180190/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title, this.nama}) : super(key: key);
  final String title;
  final String nama;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
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
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Selamat Datang " + widget.nama),
            RaisedButton(
                color: Colors.cyan,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage(title: "Login")),
                  );
                }
                ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
