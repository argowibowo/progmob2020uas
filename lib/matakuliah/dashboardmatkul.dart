import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {
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
                leading: Icon(Icons.book_sharp),
                title: Text("Pemograman Mobile"),
                subtitle: Text("SI333"),
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