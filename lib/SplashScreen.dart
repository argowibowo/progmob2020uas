import 'dart:async';

import 'package:baru1/Mahasiswa/dashboard_mahasiswa.dart';
import 'package:baru1/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:baru1/main.dart';
import 'package:baru1/Login.dart';
//import 'package:baru1/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}
class _SplashScreenPageState extends State<SplashScreenPage> {
  int isLogin = 0;

  //utk animasi berubah ukuran
  var isChanged = false;
  //nilai awal sblm diubah ukuran
  double _height = 200;
  double _width = 200;

  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 1);
    Timer(duration, () {
      startSplashScreen();
      setState(() {
        if(_height != 400)
          _height = _height + 50;
        if(_width != 400)
          _width = _width + 50;
      });
    });
  }


  startSplashScreen() async {
    var duration = const Duration(seconds: 6);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = pref.getInt("is_login");
    if(login == 0){
      return Timer(duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Halo Push",)));
      });
    }else {
      return Timer(duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login(title: "Hello Push",)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo_app.jpg",
              width: 200,
              height: 200,
            ),
            Text(
              "Book",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
