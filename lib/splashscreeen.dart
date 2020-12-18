import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_app/login.dart';
import 'dashboardMain.dart';

class MySplash extends StatefulWidget {
  MySplash({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    navigateLogin();
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Dashboard(title: "Main Dashboard")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        backgroundColor: Colors.white,
        loaderColor: Colors.black,
        photoSize: 50,
        navigateAfterSeconds: MainScreen()
    );
    throw UnimplementedError();
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: login(title: "Login")
    );
  }
}










