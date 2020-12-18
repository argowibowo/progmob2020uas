import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Dosen/addDos.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboarddos extends StatefulWidget {
  Dashboarddos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboarddosState createState() => _DashboarddosState();
}

  class _DashboarddosState extends State<Dashboarddos> {
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
                  MaterialPageRoute(builder: (context) => addDos(title: "Tambah Dosen")),
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
                  title: Text("Han Ji Pyeong"),
                  subtitle: Text("081234567890 - jipyeong@gmail.com"),
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
                                      MaterialPageRoute(builder: (context) => UpdateDos(title: "Input Data Dosen")).then(onGoBack);
                                  )
                                },
                              ),
                              FlatButton(
                                child: Text("Delete"),
                                onPressed: () async {
                                  ApiServices()deleteDos(lDos[position].nidn);
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
