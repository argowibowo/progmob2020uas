import 'package:flutter/material.dart';
import 'package:flutter_72180219/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMahasiswa extends StatefulWidget {
  DashboardMahasiswa({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                    children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Sumiati Atun"),
                    subtitle: Text("NIM : 72180119"),
                    trailing: PopupMenuButton(
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                         new PopupMenuItem<String>(
                            child: const Text('update'), value : 'update'),
                         new PopupMenuItem<String>(
                           child: const Text('delete'), value : 'delete'),
                    ],
                  )
                )
                    ],
                ),
            ),
          ),
      ),
    );
  }
}