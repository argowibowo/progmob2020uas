import 'package:flutter/material.dart';

class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {

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
                  title: Text("Julio Gerald Premaldy Philippus"),
                  subtitle: Text("72180203 - julio.gerald@si.ukdw.ac.id"),
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