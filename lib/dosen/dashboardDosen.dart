import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Dosen"),
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
                  leading: Icon(Icons.person),
                  title: Text("Argo Wibowo"),
                  subtitle: Text("0313131 - argo.wibowo@staff.ukdw.ac.id"),
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