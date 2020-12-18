import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Jadwal/addJdwl.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardjdwl extends StatefulWidget {
  Dashboardjdwl({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardjdwlState createState() => _DashboardjdwlState();
}

class _DashboardjdwlState extends State<Dashboardjdwl> {
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
            onPressed: (){},
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
                  title: Text("Jadwal"),
                  subtitle: Text("Senin, 13:30-15:30"),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => UpdateJdwl(title: "Input Data Jadwal")).then(onGoBack);
                                  )
                                },
                              ),
                              FlatButton(
                                child: Text("Delete"),
                                onPressed: () async {
                                  ApiServices()deleteJdwl(lJdwl[position].nim);
                                  Navigator.pop(context);
                                  setState(() {});
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
