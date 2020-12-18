import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'package:progmob_setelah_uts_72180190/matakuliah/addmatkul.dart';
import 'package:progmob_setelah_uts_72180190/matakuliah/updateMatkul.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
  final _formkey = GlobalKey<FormState>();

  List<Matakuliah> lMatkul = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddMatkul(title: "Input Data matakuliah")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something Wrong With Message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            lMatkul = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin:
                  new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lMatkul[position].nama +
                          " | " +
                          lMatkul[position].kode),
                      subtitle: Text("Hari: " + lMatkul[position].hari + " | " + "Sesi: " + lMatkul[position].sesi + " | " + "SKS: " + lMatkul[position].sks),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("Update"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateMatkul(
                                                    title:
                                                    "Update Data Matakuliah",
                                                    matkul: lMatkul[position],
                                                    kodecari:
                                                    lMatkul[position].kode,
                                                  ))).then(onGoBack);
                                    },
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                  ),
                                  FlatButton(
                                    child: Text("Delete"),
                                    onPressed: () async {
                                      ApiServices()
                                          .deleteMatkul(lMatkul[position].kode)
                                          .then(onGoBack);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                );
              },
              itemCount: lMatkul.length,
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
