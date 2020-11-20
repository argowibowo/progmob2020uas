import 'dart:ffi';

import 'package:flutter/material.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();


  Void Validate(){
    if (key.currentState.validate()){
      print("Validate");
    }
    else {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("TUGAS PERTEMUAN 8"),
      ),
      body: Center(
        child: Form(
          key: key,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "Nama Tidak Boleh Kosong";
                }
              },
              decoration: new InputDecoration(
                icon: Icon(Icons.person),
                  labelText: "Nama Lengkap",
                  hintText: "Contoh: Dito Adriel",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)
                )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: Validate,
              child: Text("SIMPAN", style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}