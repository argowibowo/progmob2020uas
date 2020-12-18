import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob/Matakuliah/addMatkul.dart';
import 'package:flutter_progmob/Matakuliah/updateMatkul.dart';
import 'package:flutter_progmob/apiservice.dart';
import 'package:flutter_progmob/model.dart';
import 'package:flutter_progmob2020/Apiservices.dart';
import 'package:flutter_progmob2020/Matakuliah/AddMatkul.dart';
import 'package:flutter_progmob2020/Matakuliah/UpdateMatkul.dart';
import 'package:flutter_progmob2020/Model.dart';

class Matkul extends StatefulWidget {   //<~
  Matkul({Key key, this.title}) : super(key: key);  //<~~

  final String title;

  @override
  _MatkulState createState() => _MatkulState();   //<~
}

class _MatkulState extends State<Matkul> {    //<~~
  final _formKey = GlobalKey<FormState>();

  List<MataKuliah> listMatkul;

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
        backgroundColor: Colors.brown,
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
      backgroundColor: Colors.blueGrey,
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder: (BuildContext context, AsyncSnapshot<List<MataKuliah>> snapshot) {
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
                      title: Text(listMatkul[position].kodeMataKuliah + " - " + listMatkul[position].nama),
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
                                        ApiServices().deleteMatkul(listMatkul[position].kodeMataKuliah);
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