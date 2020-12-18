import 'package:flutter/material.dart';
import 'package:flutter_72180247/pertemuan 2/login.dart';
import 'dart:async';

// import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget{
  // Splash({Key key}) : super(key: key);
  @override
  _Splash createState() => _Splash();
}

 class _Splash extends State<Splash>{
   startTime() async {
     var _duration = new Duration(seconds: 2);
     return new Timer(_duration, navigationPage);
   }

   void navigationPage() {
     Navigator.of(context).pushReplacementNamed('/LoginPage');
   }
  //final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    startTime();
    //startSplashScreen();
  }

  // startSplashScreen() async{
  //   var durasi = const Duration(seconds:3);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int login = pref.getInt("is_login");
  //   if (login == 0) {
  //     return Timer(durasi, () {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)));
  //     });
  // }else{
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => login(title: "Pertemuan 2",)),
  //     );
  //   }
  //   return Timer(durasi, (){
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_){
  //         return Pertemuan2();
  //       }),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.red,
    body: Center(
      child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
              children: [
                Image.asset(
                  "images/logo_ayam.jpg",
                  width: 400.0,
                  height: 300.0,
                ),
                  Text("PROGMOB!?!?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
              ]
                  ),
        ),
      ),
    )
    );
  }
}