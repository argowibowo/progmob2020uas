import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
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
                  leading: Icon(Icons.library_books),
                  title: Text("Pemograman Mobile"),
                  subtitle: Text("Argo Wibowo"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
