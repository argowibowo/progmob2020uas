import 'package:flutter/material.dart';
import 'package:progmob_aftuts/Animation/fadeAnimation.dart';
import 'dart:async';

import 'package:progmob_aftuts/Colors/constant.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';


class TugasPertemuan8 extends StatefulWidget {
  static const String id = 'tugas_pert8';

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Tugas Pertemuan 8',
      //     style: TextStyle(
      //         color: kBackgroundColor,
      //         fontWeight: FontWeight.w600),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.0,
                      TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        decoration: new InputDecoration(
                          hintText: "Misalnya: Ken Sanio",
                          labelText: "Nama Lengkap",
                          icon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harus Diisi ya mas';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    FadeAnimation(
                      1.3,
                      RaisedButton(
                        child: Container(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              color: kBackgroundColor,
                            ),
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
