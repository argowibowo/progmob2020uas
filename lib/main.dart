import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob/splashscreen.dart';
import 'package:flutter_progmob/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Tugas Pertemuan 1'),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isiLogin = pref.getInt("is_login");
    if(isiLogin ==1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Tugaspertemuan8(title: "Welcome",)),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text(
                'Login'
              ),
                onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Tugaspertemuan8(title: "Welcome",)),
                  );
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
