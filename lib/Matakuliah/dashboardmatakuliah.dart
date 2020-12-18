import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progmob_flutter/Matakuliah/addmatakuliah.dart';
import 'package:progmob_flutter/Matakuliah/updatematakuliah.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'dart:async';
import 'addmatakuliah.dart';
import 'updatematakuliah.dart';

class Matakuliahdb extends StatefulWidget {
  Matakuliahdb({Key key, this.title}) :super(key:key);
  final String title;
  @override
  _MatakuliahdbState createState() => _MatakuliahdbState();
}

class _MatakuliahdbState extends State<Matakuliahdb> {
  final _formkey = GlobalKey<FormState>();

  List<Matkul> lMtkl = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Matakuliah"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMtkl(title: "Tambah Matakuliah",)),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Matkul>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ada yang salah: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            lMtkl = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                            lMtkl[position].nama + " - " + lMtkl[position].kode),
                        subtitle: Text("Hari "+lMtkl[position].hari + " Sesi " + lMtkl[position].sesi ),
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(lDsn[position].foto),
                        // ),
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
                                          MaterialPageRoute(builder: (context) => UpdateMtkl(title:"Ubah data",mtkl: lMtkl[position],kodecari: lMtkl[position].kode)),
                                        ).then(onGoBack);
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
                                            .deleteMatkul(lMtkl[position].kode);
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
              itemCount: lMtkl.length,
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