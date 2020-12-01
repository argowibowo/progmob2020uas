import 'package:flutter/material.dart';

class dashboardmhs extends StatefulWidget {
  dashboardmhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardmhsState createState() => _dashboardmhsState();
}

class _dashboardmhsState extends State<dashboardmhs> {

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
                  leading: Icon(Icons.person),
                  title: Text("Keren Kezia"),
                  subtitle: Text("72180222 - keren.kezia@si.ukdw.ac.id"),
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