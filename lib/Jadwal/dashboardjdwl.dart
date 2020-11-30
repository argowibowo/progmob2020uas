import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardjdwl extends StatefulWidget {
  Dashboardjdwl({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardjdwlState createState() => _DashboardjdwlState();
}

class _DashboardjdwlState extends State<Dashboardjdwl> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard Jadwal",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
