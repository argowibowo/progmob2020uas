import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
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
                    leading: Icon(Icons.people_outline),
                    title: Text("Adrian Yunas Wicaksono"),
                    subtitle: Text("72180183 - adrian.yunas@si.ukdw.ac.id"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Eagle'),
                          new PopupMenuItem<String>(
                              child: const Text('Delete'), value: 'Snake'),
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