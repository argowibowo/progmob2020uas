import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){

            },
          )
        ],
      ),
      body: Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Jong Jek Siang"),
                    subtitle: Text("NIDN - jjs@staff.ukdw.ac.id"),
                    onLongPress: (){
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FlatButton(
                                  child: Text("Update"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 5,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                FlatButton(
                                  child: Text("Delete"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          )
                      );
                    },
                  )
                ],
              ),
            )
      ),
    );
  }
}