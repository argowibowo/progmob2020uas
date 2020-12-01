import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Login.dart';


class Dashboard_dosen extends StatefulWidget {
  Dashboard_dosen({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _Dashboard_dosenState createState() => _Dashboard_dosenState();
}

class _Dashboard_dosenState extends State<Dashboard_dosen> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosen"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){},
          )
        ],

      ),

      body: Container(
        child: Card(
          child : Column(
            mainAxisSize: MainAxisSize.min,
            children : <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Jong Jek Siang"),
                subtitle: Text("0516180230 - jjs@staff.ukdw.ac.id"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                "Update",
                                style: TextStyle(

                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //nanti akan pindah ke menu update dosen
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(

                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //nanti akan pindah ke menu delete dosen
                              },
                            ),
                          ],
                        ),
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}