import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/tugaspertemuan8.dart';

class MySplash extends StatefulWidget {
  MySplash({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  void _incrementCounter() {
    setState(() {

    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => tugaspertemuan8(title: "TUGAS PERTEMUAN 1 ")));
    }
  }

  @override
  void initState(){
    super.initState();
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 1,
        backgroundColor: Colors.white,
        image: Image.asset('assets/logo.png'),
        loaderColor: Colors.black,
        photoSize: 150,
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
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: login(title: 'fafa',)
    );
  }
}










