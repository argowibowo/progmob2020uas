import 'package:flutter/material.dart';
import 'package:progmob_aftuts/Colors/constant.dart';
import 'package:progmob_aftuts/Pages/loginPage.dart';
import 'package:progmob_aftuts/SplashScreen/spalshscreen.dart';
import 'package:progmob_aftuts/tugaspertemuan8.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class _MyAppState extends State<MyApp> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemrograman Mobile',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(bodyText2: TextStyle(color: kBodyTextColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreenPage.id,
      routes: {
        SplashScreenPage.id: (context) => SplashScreenPage(),
        LoginPage.id : (context) => LoginPage(),
        TugasPertemuan8.id: (context) => TugasPertemuan8(),
      },
    );
  }
}

