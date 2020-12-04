import 'package:flutter_72160025/Dosen/addDosen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dosen extends StatefulWidget {
  dosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dosenState createState() => _dosenState();
}

class _dosenState extends State<dosen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addDosen(title: "Tambah Dosen")),
              );
            },
          )
        ],
      ),
      body: Container(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("hay brian eldrin"),
                  subtitle: Text("081226314259 - brianeldrin@si.ukdw.ac.id"),
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
                        ));
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}