import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardDosen extends StatefulWidget {
  DashBoardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardDosenState createState() => _DashBoardDosenState();
}

class _DashBoardDosenState extends State<DashBoardDosen> {
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
                leading: Icon(Icons.person_outline),
                title: Text("Argo Wibowo"),
                subtitle: Text("0516112022 - argowibowo@staff.ukdw.ac.id"),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                    child: const Text('Update'), value: 'Udt'),
                    new PopupMenuItem<String>(
                    child: const Text('Delete'), value: 'Del',),
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
