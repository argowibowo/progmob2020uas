import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_add_outlined),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
          child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text("Pemrograman Mobile"),
                    subtitle: Text("SI3333 - Argo Wibowo, S.T., M.T."),
                    onLongPress: (){
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FlatButton(
                                  child: Text("Update"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("Delete"),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          )
                      );
                    },
                  ),
                ],
              )
          )
      ),
    );
  }
}