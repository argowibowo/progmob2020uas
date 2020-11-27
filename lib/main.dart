import 'package:flutter/material.dart';
import 'package:flutter_keren/tugaspertemuan8.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_keren/pertemuan1.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 20,
      backgroundColor: Color(0xFFFFE7F5),
      image: Image.asset('assets/splash.jpg'),
      loaderColor: Colors.white,
      photoSize: 150.0,
      navigateAfterSeconds: MyHomePage(),
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
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Login Page')),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLogin();
    });
  }
}