import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget{
  DashboardMatakuliah({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.library_books_rounded,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Pemrograman Mobile",
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                  ),
                ),
                subtitle: Text(
                  "[SI3333]  - Grup D",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
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
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //pindah ke menu update
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //pindah ke menu delete
                              },
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
    );
  }

}