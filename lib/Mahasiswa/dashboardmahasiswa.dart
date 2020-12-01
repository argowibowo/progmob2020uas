import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mahasiswa extends StatefulWidget {
  @override
  _MahasiswaState createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Mahasiswa"),
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
                  leading: Icon(Icons.people),
                  title: Text("Bhenedicto Adriel N P "),
                  subtitle: Text("08127127 - ditoadriel@gmail.com"),
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
