import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jadwal extends StatefulWidget {
  @override
  _JadwalhState createState() => _JadwalhState();
}

class _JadwalhState extends State<Jadwal> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Jadwal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
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
                  leading: Icon(Icons.lock_clock),
                  title: Text("Pemrograman Mobile"),
                  subtitle: Text("SI01273 - Sesi 1 - 07.00-17.00"),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return List<PopupMenuEntry<String>>()
                        ..add(PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Edit'),
                        ))
                        ..add(PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Delete'),
                        ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
