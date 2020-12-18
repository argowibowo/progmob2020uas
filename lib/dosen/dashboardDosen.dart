import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'dart:async';
import 'addDsn.dart';
import 'updateDsn.dart';

class DashboardDsn extends StatefulWidget {
  DashboardDsn({Key key, this.title}) :super(key:key);
  final String title;
  @override
  _DashboardDsnState createState() => _DashboardDsnState();
}

class _DashboardDsnState extends State<DashboardDsn> {
  final _formkey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Dosen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDsn(title: "Tambah Data Dosen",)),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getDosen(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Kesalahan: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            lDsn = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                            lDsn[position].nama + " - " + lDsn[position].nidn),
                        subtitle: Text(lDsn[position].email),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(lDsn[position].foto),
                        ),
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text("UPDATE"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UpdateDsn(title:"Edit Data Dosen",dsn: lDsn[position],nidncari: lDsn[position].nidn)),
                                        ).then(onGoBack);
                                      },
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 20,
                                    ),
                                    FlatButton(
                                      child: Text("DELETE"),
                                      onPressed: () async {
                                        ApiServices()
                                            .deleteDsn(lDsn[position].nidn);
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
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}