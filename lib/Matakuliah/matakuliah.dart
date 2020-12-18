import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/Matakuliah/MatkulUpdate.dart';
import 'package:flutter_app/Matakuliah/MatkulTambah.dart';
import 'package:flutter_app/model.dart';
import 'package:flutter_app/apiservices.dart';

class dashboardMatakuliah extends StatefulWidget {
  dashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboardMatakuliahState createState() => _dashboardMatakuliahState();
}

class _dashboardMatakuliahState extends State<dashboardMatakuliah> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> listMatakuliah = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
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
        backgroundColor: Colors.grey,
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
            listMatakuliah = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(listMatakuliah[position].kode + ", " + listMatakuliah[position].nama),
                      subtitle: Text(listMatakuliah[position].hari + " - " + listMatakuliah[position].sesi + " - "
                          + listMatakuliah[position].sks),

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
                                                matkul: listMatakuliah[position],
                                                kodecari: listMatakuliah[position].kode))
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
                                        ApiServices().deleteMatkul(listMatakuliah[position].kode);
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
              itemCount: listMatakuliah.length,
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