import 'package:flutter/material.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {


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
                    leading: Icon(Icons.my_library_books_rounded),
                    title: Text("Progmob"),
                    subtitle: Text("Jumat -L.Mis"),
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