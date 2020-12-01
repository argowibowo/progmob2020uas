import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardJadwal extends StatefulWidget {
  DashBoardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardJadwalState createState() => _DashBoardJadwalState();
}

class _DashBoardJadwalState extends State<DashBoardJadwal> {
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
                      leading: Icon(Icons.watch_later_outlined),
                      title: Text("Senin"),
                      subtitle: Text("SI3343 - Keamanan TI - 11.30 "),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Udt'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Del',),
                        ],
                      )
                  ),
                  ListTile(
                      leading: Icon(Icons.watch_later_outlined),
                      title: Text("Senin"),
                      subtitle: Text("SI4323 - Manajemen Rantai Pasok - 15.30 "),
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
