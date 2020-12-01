import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_72180185/dashboard.dart';
import 'package:flutter_72180185/main.dart';
import 'package:flutter_72180185/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  // startSplashScreen() async {
  //   var duration = const Duration(seconds: 5);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int login = pref.getInt("is_login");
  //   if(login == 0){
  //   return Timer(duration, () {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)));
  //   });
  // }else {
  //     return Timer(duration, () {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "TugasPertemuan8",)));
  //     });
  //   }
  // }

  startSplashScreen() async {
      var duration = const Duration(seconds: 5);
      SharedPreferences pref = await SharedPreferences.getInstance();
      int login = pref.getInt("is_login");
      if(login == 0){
      return Timer(duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)));
      });
    }else {
        return Timer(duration, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "TugasPertemuan8",)));
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
        Image.asset("images/diamond.png",
          width: 200,
          height: 200,
        ),
        Text(
          "DIAMOND",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
          ),
        ],
    ),
      ),
    );
  }
}

