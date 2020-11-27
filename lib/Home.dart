import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(

        child: new Row(

          children: <Widget>[

            IconButton(
              icon: Icon(Icons.account_balance),
              iconSize: 85,
              color: Colors.redAccent,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.access_alarm_rounded),
              iconSize: 85,
              color: Colors.redAccent,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.accessibility),
              iconSize: 85,
              color: Colors.redAccent,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.accessible_forward_outlined),
              iconSize: 85,
              color: Colors.redAccent,
              onPressed: () {},
            ),

          ],

        ),

      ),
    );
  }
}