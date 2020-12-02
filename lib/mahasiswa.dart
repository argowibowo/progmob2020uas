import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMahasiswa extends StatefulWidget {
  DashboardMahasiswa({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
  }

  class _DashboardMahasiswaState extends State<DashboardMahasiswa>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
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
                      title: Text("Ester Siwu"),
                      subtitle: Text("72180264 - ester.glorya@si.ukdw.ac.id"),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}