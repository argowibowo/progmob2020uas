import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_progmob2020/apiServices.dart';
import 'package:flutter_app_progmob2020/model.dart';
import 'package:flutter_app_progmob2020/matakuliah/addMatakuliah.dart';
import 'package:flutter_app_progmob2020/matakuliah/updateMatakuliah.dart';

class DashMk extends StatefulWidget {
  DashMk({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashMkState createState() => _DashMkState();
}

class _DashMkState extends State<DashMk> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> listMatkul;

  FutureOr onGoBack(dynamic value) {
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Matakuliah"))
                ).then(onGoBack);
              }
          )
        ],
      ),
      backgroundColor: Colors.green[800],
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listMatkul = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(listMatkul[position].kode + " - " + listMatkul[position].nama),
                      subtitle: Text("Hari " + listMatkul[position].hari + " - Sesi " + listMatkul[position].sesi
                          + " - " + listMatkul[position].sks),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UpdateMatkul(title: "Update Data Matakuliah",
                                                matkul: listMatkul[position],
                                                kodecari: listMatkul[position].kode))
                                        ).then(onGoBack);
                                      },
                                      child: Text("Update")
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                  ),
                                  FlatButton(
                                      onPressed: () async {
                                        ApiServices().deleteMatkul(listMatkul[position].kode);
                                        Navigator.pop(context);
                                        setState(() {

                                        });
                                      },
                                      child: Text("Delete")
                                  ),
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: listMatkul.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}