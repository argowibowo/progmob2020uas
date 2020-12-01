import 'package:flutter/material.dart';

class DashboardDsn extends StatefulWidget {
  DashboardDsn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDsnState createState() => _DashboardDsnState();
}

class _DashboardDsnState extends State<DashboardDsn> {

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
                  title: Text("Argo Wibowo, S.T., M.T."),
                  subtitle: Text("0848523 - argo.wibowo@staff.ukdw.ac.id"),
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