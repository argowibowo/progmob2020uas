import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Jadwal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed:(){},
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
                      leading: Icon(Icons.access_time_sharp),
                      title: Text("Senin, 10.30"),
                      subtitle: Text("Pemograman Mobile"),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}

class Login {

}