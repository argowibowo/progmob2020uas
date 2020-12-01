import 'package:flutter/material.dart';

class dashboardjadwal extends StatefulWidget {
  dashboardjadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardjadwalState createState() => _dashboardjadwalState();
}

class _dashboardjadwalState extends State<dashboardjadwal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            )
          ]
      ),

      body: Container(
        child: Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text("PROGMOB 2020"),
                  subtitle: Text("Grup B - Senin, 15:30-17:20 WIB"),
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
              ]
          ),
        ),
      ),
    );
  }
}