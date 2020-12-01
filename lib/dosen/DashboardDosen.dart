import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DOSEN"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body : Container(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Argo Wibowo"),
                  subtitle: Text("0516119002 - argo@staff.ukdw.ac.id"),
                  onLongPress: (){
                    showDialog(
                        context: context,
                    builder: (_) => new AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Delete"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ));
                  },
                )
              ],
              ),
          ),
        ),
    );
  }
}