import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardDataJadwal extends StatefulWidget {
  DashBoardDataJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardDataJadwalState createState() => _DashBoardDataJadwalState();
}

class _DashBoardDataJadwalState extends State<DashBoardDataJadwal> {
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
                      subtitle: Text("MH1063 - 07.30 "),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Updatee'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Delete',),
                        ],
                      )
                  ),
                  ListTile(
                      leading: Icon(Icons.watch_later_outlined),
                      title: Text("Selasa"),
                      subtitle: Text("SI2313 - 10.00 "),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Update'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Delelete',),
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