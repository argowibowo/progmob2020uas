import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}
class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
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
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            ),
          ],
        ),
        body: Container(
            child: GestureDetector(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.book_sharp),
                        title: Text("Pemrograman Mobile"),
                        subtitle: Text("SI333"),
                        onLongPress: (){
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}