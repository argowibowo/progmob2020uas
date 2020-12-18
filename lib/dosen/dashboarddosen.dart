import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_progmob_72180181/apiservices.dart';
import 'package:flutter_app_progmob_72180181/dashboard.dart';
import 'package:flutter_app_progmob_72180181/dosen/adddsn.dart';
import 'package:flutter_app_progmob_72180181/dosen/updatedsn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_progmob_72180181/main.dart';
import 'package:flutter_app_progmob_72180181/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  //int _counter = 2;
  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDosen(title: "Input Data Dosen")),
                ).then(onGoBack);
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard())
                );
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getDosen(),
          builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lDsn = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lDsn[position].nama + " - " + lDsn[position].nidn),
                          subtitle: Text(lDsn[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lDsn[position].foto),
                          ),
                          onLongPress: (){
                            showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text("Update"),
                                        onPressed: (){
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UpdateDsn(title: "Input Data Mahasiswa", dsn:lDsn[position], nidncari: lDsn[position].nidn)),
                                          ).then(onGoBack);
                                        },
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        height: 20,
                                      ),
                                      FlatButton(
                                        child: Text("Delete"),
                                        onPressed: () async{
                                          ApiServices().deleteMhs(lDsn[position].nidn);
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      )
                  );
                },
                itemCount: lDsn.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}