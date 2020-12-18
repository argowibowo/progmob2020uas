import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob/TugasPertemuan1.dart';
import 'package:flutter_progmob/bottomnav.dart';
import 'package:flutter_progmob/dashboard.dart';
import 'package:flutter_progmob/pertemuan1.dart';
import 'package:flutter_progmob/UAS/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'UAS/Mahasiswa/dshbrdmhs.dart';




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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    navigateLogin();
  }

  navigateLogin() async {
    var dur = const Duration(seconds: 3);
    SharedPreferences pref = await SharedPreferences.getInstance();


      int isLogged = pref.getInt("is_logged");
      if (isLogged == 1) {
        return Timer(dur,(){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Dashboard(title: 'Nav',)),
        );
      });
      } else {
        return Timer(dur,(){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginPage(title: 'Nav',)),
        );
        });
      }


  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      backgroundColor: Colors.black,
      image: Image.asset('assets/splashfire.gif'),
      photoSize: 150.0,
    );

  }



}