import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}
class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Data Matakuliah"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          key: _formKey,
          child: GestureDetector(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.calendar_today_outlined),
                      title: Text("Pemrograman Mobile"),
                      subtitle: Text("10.30"),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}