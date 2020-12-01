import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Login.dart';


class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
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
        title: Text("Matakuliah"),
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
                title: Text("Matrikulasi Logika Pemograman"),
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
                                //nanti akan pindah ke menu update jadwal
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
                                //nanti akan pindah ke menu update jadwal
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