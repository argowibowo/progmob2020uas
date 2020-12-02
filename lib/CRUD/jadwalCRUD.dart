import 'package:flutter/material.dart';

class JadwalCRUD extends StatefulWidget {
  @override
  _JadwalCRUDState createState() => _JadwalCRUDState();
}

class _JadwalCRUDState extends State<JadwalCRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD JADWAL"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Card(
          child : Column(
            mainAxisSize: MainAxisSize.min,
            children : <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Pemrograman Mobile"),
                subtitle: Text("Jumat, (09.30 - 11.20)"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                "Update Data",
                              ),
                              onPressed: (){},
                            ),
                            FlatButton(
                              child: Text(
                                "Delete Data",
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
