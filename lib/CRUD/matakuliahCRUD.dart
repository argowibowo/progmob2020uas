import 'package:flutter/material.dart';

class MatakuliahCRUD extends StatefulWidget {
  @override
  _MatakuliahCRUDState createState() => _MatakuliahCRUDState();
}

class _MatakuliahCRUDState extends State<MatakuliahCRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD MATAKULIAH"),
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
                subtitle: Text("SI2222 - Argo Wibowo, S.T., MT."),
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
