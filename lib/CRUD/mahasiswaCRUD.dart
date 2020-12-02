import 'package:flutter/material.dart';

class MahasiswaCRUD extends StatefulWidget {
  @override
  _MahasiswaCRUDState createState() => _MahasiswaCRUDState();
}

class _MahasiswaCRUDState extends State<MahasiswaCRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD MAHASISWA"),
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
                title: Text("Ken Sanio Melenium Thea Agatha"),
                subtitle: Text("72180234 - ken.thea16@gmail.com"),
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
