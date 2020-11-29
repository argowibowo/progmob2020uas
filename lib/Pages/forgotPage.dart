import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/icons/main1.png",
                      height: 600,
                    ),
                    heightFactor: 0.75,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Ken Baru Nyiapin Sesuatu',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sabar ya Ken Baru nyiapin sesuatu untuk kamu",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
