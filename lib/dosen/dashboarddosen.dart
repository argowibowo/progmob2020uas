import 'package:flutter/material.dart';
import 'package:flutter_progmob/main.dart';
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
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: GestureDetector(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Bright Vachirawit"),
                  subtitle: Text("0112233 - bright@gmail.com"),
                  trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                        child: const Text('Update'), value: 'Doge'),
                      new PopupMenuItem<String>(
                        child: const Text('Delete'), value: 'Lion',
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          )
      ),
      );

  }
}