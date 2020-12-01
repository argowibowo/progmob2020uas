import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Matakuliah extends StatefulWidget {
  @override
  _MatakuliahState createState() => _MatakuliahState();
}

class _MatakuliahState extends State<Matakuliah> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Matakuliah"),
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
                  leading: Icon(Icons.book),
                  title: Text("Pemrograman Mobile"),
                  subtitle: Text("SI01273 - Argo Wibowo"),
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
