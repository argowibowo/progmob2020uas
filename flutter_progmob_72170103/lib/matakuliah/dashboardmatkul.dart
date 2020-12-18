import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprogmob72170103/matakuliah/updatematkul.dart';
import 'package:flutterprogmob72170103/apiservices.dart';
import 'package:flutterprogmob72170103/model.dart';
import 'addmatkul.dart';

class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMatkul(title: "Masukkan Mata Kuliah"))
                ).then(onGoBack);
              }
          )
        ],
      ),

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
                      title: Text(listMatkul[position].kodeMatkul + " - " + listMatkul[position].nama),
                      subtitle: Text("Hari " + listMatkul[position].hari.toString() + " - Sesi " + listMatkul[position].sesi.toString()
                          + " - " + listMatkul[position].sks.toString()),
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(listMatkul[position].foto),
                      // ),
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
                                                kodeMatkul_cari: listMatkul[position].kodeMatkul))
                                        ).then(onGoBack);
                                      },
                                      child: Text("Update")
                                  ),
                                  Divider(
                                    color: Colors.brown,
                                    height: 20,
                                  ),
                                  FlatButton(
                                      onPressed: () async {
                                        ApiServices().deleteMatkul(listMatkul[position].kodeMatkul);
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