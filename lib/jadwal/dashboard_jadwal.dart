import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Login.dart';


class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
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
        title: Text("Jadwal"),
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