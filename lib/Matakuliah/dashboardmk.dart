import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardmk extends StatefulWidget {
  Dashboardmk({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardmkState createState() => _DashboardmkState();
}

class _DashboardmkState extends State<Dashboardmk> {
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
          child: Text("Dashboard MataKuliah",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
