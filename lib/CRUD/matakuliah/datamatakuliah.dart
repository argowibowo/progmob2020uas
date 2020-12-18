import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/CRUD/matakuliah/AddMatkul.dart';
import 'package:flutter_app/CRUD//matakuliah/UpdateMatkul.dart';
import 'package:flutter_app/model.dart';

class DashboardDataMatakuliah extends StatefulWidget {
  DashboardDataMatakuliah({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardDataMatakuliahState createState() => _DashboardDataMatakuliahState();
}


class _DashboardDataMatakuliahState extends State<DashboardDataMatakuliah> {
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
        title: Text("Menu Data Matakuliah"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMatkul(title: "Tambah Data Matakuliah"))
              ).then(onGoBack);},
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Data Error: ${snapshot.error.toString()}"
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
                      subtitle: Text("Hari " + listMatkul[position].hari.toString() + " - Sesi " + listMatkul[position].sesi.toString()
                          + " - " + listMatkul[position].sks.toString()),
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