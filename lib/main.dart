// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:progmob_flutter/pertemuan1.dart';
import 'package:progmob_flutter/tugasPertemuan1Widget.dart';

void main(){
  runApp(MyApp());
}

//stateless : tidak bisa diotak atik.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme:ThemeData(
      //menggambil kelas apa yang nanti digunakan pake home
      primarySwatch : Colors.blue,
      visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
        home: TugasPertemuan1Widget(
        title:"Tugas Pertemuan 1"
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _MyHomePageState createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child : Icon(Icons.add),
      ),
    );
  }
}
