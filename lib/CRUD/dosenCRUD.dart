import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_aftuts/API/apiService.dart';
import 'package:progmob_aftuts/CRUD/tambahDosen.dart';
import 'package:progmob_aftuts/CRUD/updateDosen.dart';
import '../model.dart';

class DosenCRUD extends StatefulWidget {
  DosenCRUD({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DosenCRUDState createState() => _DosenCRUDState();
}

class _DosenCRUDState extends State<DosenCRUD> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> listDosen;

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
        title: Text("CRUD DOSEN"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TambahDosen(title: "Input Data Dosen"))
                ).then(onGoBack);
              }
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getDosen(),
        builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Ada sesuatu yang janggal ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listDosen = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return SafeArea(
                  child: Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(listDosen[position].nama + ", " + listDosen[position].gelar),
                        subtitle: Text(listDosen[position].nidn + " - " + listDosen[position].email),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(listDosen[position].foto),
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
                                              MaterialPageRoute(builder: (context) => UpdateDosen(title: "Update Data Dosen",
                                                  dosen: listDosen[position],
                                                  nidncari: listDosen[position].nidn))
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
                                          ApiServices().deleteDosen(listDosen[position].nidn);
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
                  ),
                );
              },
              itemCount: listDosen.length,
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