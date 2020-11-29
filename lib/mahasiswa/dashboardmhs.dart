import 'package:flutter/material.dart';

class DashboardMahasiswa extends StatefulWidget {
  DashboardMahasiswa({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  final _formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {},
          )
        ],
      ),

      body: Container(
        child: GestureDetector(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Felix Rivaldo"),
                  subtitle: Text("72180190 - felix@gmail.com"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
