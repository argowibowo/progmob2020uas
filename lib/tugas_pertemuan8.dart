import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class tugas_pertemuan8 extends StatefulWidget {
  tugas_pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugas_pertemuan8State createState() => _tugas_pertemuan8State();
}

class _tugas_pertemuan8State extends State<tugas_pertemuan8> {
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
                hintText: "Thalia",
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "NIM",
                  hintText: "72170144",
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
