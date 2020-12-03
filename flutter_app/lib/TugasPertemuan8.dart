import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Nama Lengkap",
                hintText: "Aimiya",
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "NIM",
                  hintText: "72170142",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "Save",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
