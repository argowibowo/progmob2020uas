import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {

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
                title: Text("Pemrograman Mobile"),
                subtitle: Text("Argo Wibowo, S.T., M.T."),
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