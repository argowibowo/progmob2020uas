import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_2020/apiservices.dart';
import 'package:flutter_2020/mahasiswa/addmhs.dart';
import 'package:flutter_2020/mahasiswa/updatemhs.dart';
import 'package:flutter_2020/model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Dashboardmah extends StatefulWidget {
  Dashboardmah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardmahState createState() => _DashboardmahState();
}

class _DashboardmahState extends State<Dashboardmah> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> lMhs = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRouter(builder: (context) =>
                      AddMhs(title: "Input Data Mahasiswa")),
                ).then(onGoBack);
              },
            )
          ],
        ),
        body: FutureBuilder(
          builder: (BuildContext context,
              AsyncSnapshot<List<Mahasiswa>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: $(snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              lMhs = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lMhs[position].nama + " - " +
                              lMhs[position].nim),
                          subtitle: Text(lMhs[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lMhs[position].foto),
                          ),
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (_)
                            =>
                            new AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisStyle.min,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("Update"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRouter(builder: (context) =>
                                            UpdateMhs(
                                                title: "Input Data Mahasiswa",
                                                mhs: lMhs[position],
                                                nimcari: lMhs[position].nim)),
                                      ).then(onGoBack);
                                    },
                                  ),
                                  Divider(
                                    color: Colors.yellow,
                                    height: 20,
                                  ),
                                  FlatButton(
                                    child: Text("Delete"),
                                    onPressed: () async {
                                      ApiServices().deleteMhs(
                                          lMhs[position].nim);
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
                itemCount: lMhs.length,
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