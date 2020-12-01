import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {}
          )
        ],
      ),

      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.event_note_outlined),
                title: Text("Pemograman Mobile"),
                subtitle: Text("Jumat Sesi 2 (09.30-11.30)"),
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Update")
                            ),
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Delete")
                            ),
                          ],
                        ),
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}