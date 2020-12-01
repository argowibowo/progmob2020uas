import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {
  final _formKey = GlobalKey<FormState>();
  //int _counter = 2;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.update),
              onPressed: (){},
            ),
          ],
        ),
        body: Container(
          child: GestureDetector(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.library_books),
                    title: Text("Pemrograman Mobile"),
                    subtitle: Text("Sifat M, Harga 5, 3 SKS"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Bird'),
                          new PopupMenuItem<String>(
                              child: const Text('Delete'), value: 'Tiger'),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}