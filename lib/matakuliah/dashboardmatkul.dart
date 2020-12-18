import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/matakuliah/addmatkul.dart';
import 'package:progmob_flutter/matakuliah/updatematkul.dart';

class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> listMatkul;
  Future<Null> refreshlist() async {
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      ApiServices().getMatkul();
    });
  }

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
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.add),
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Matakuliah"))
        //         ).then(onGoBack);
        //       }
        //   )
        // ],
      ),

      body: RefreshIndicator(
        onRefresh: refreshlist,
        child: FutureBuilder(
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
                        // leading: Icon(Icons.book_sharp, color: Colors.cyan),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.book_sharp, size: 35,),
                        ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Matakuliah"))
          ).then(onGoBack);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}