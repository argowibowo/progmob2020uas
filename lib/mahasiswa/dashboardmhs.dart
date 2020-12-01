import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardMhs extends StatefulWidget {
  DashBoardMhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardMhsState createState() => _DashBoardMhsState();
}

class _DashBoardMhsState extends State<DashBoardMhs> {
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
                      leading: Icon(Icons.person),
                      title: Text("Marcellus Davine Setiawan"),
                      subtitle: Text("72180184 - marcellus.davine@si.ukdw.ac.id"),
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
