import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();
  //int _counter = 2;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
          ),
            IconButton(
              icon: Icon(Icons.update),
              onPressed: (){},
            ),
        ],
      ),
      body: Container(
        child: GestureDetector(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Jong Jek Siang"),
                subtitle: Text("0516119002 - jjs@staff.ukdw.ac.id"),
                trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                      child: const Text('Update'), value: 'Doge'),
                      new PopupMenuItem<String>(
                      child: const Text('Delete'), value: 'Lion'),
          ],
    )
    )
    ],
    ),
              ),
          ),
        )
      );
  }
}