import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardDataMatakuliah extends StatefulWidget {
  DashBoardDataMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardDataMatakuliahState createState() => _DashBoardDataMatakuliahState();
}

class _DashBoardDataMatakuliahState extends State<DashBoardDataMatakuliah> {
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
            ),
          ],
        ),

        body: Container(
          child: GestureDetector(
            onLongPress: (){
              showDialog(context: null,
                child:  AlertDialog(
                  content: Column(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Edit"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("Delete"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );},
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.book_outlined),
                      title: Text("Pemrograman Mobile"),
                      subtitle: Text("SI3333 - Argo Wibowo - D"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Update'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Delete',),
                        ],
                      )
                  ),
                  ListTile(
                      leading: Icon(Icons.book_outlined),
                      title: Text("Keamanan Teknologi Informasi"),
                      subtitle: Text("SI3343 - Willy S.R - D"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Update'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Delete',),
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