import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/jadwal/addjadwal.dart';
import 'package:progmob_flutter/jadwal/updatejadwal.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> listJadwal;
  List<Dosen> listDosen;
  List<Matakuliah> listMatkul;

  FutureOr onGoBack(dynamic value) {
    setState(() {

    });
  }

  Future<Null> refreshlist() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      ApiServices().getJadwal();
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
        //             MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal"))
        //         ).then(onGoBack);
        //       }
        //   )
        // ],
      ),

      body: RefreshIndicator(
        onRefresh: refreshlist,
        child: FutureBuilder(
          future: ApiServices().getJadwal(),
          builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot) {
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              listJadwal = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(listJadwal[position].nama_matkul + " (" + listJadwal[position].sks + " SKS) - " + listJadwal[position].nama_dosen),
                        subtitle: Text("Hari " + listJadwal[position].hari + " - Sesi " + listJadwal[position].sesi),
                        // leading: Icon(Icons.event_note_outlined, color: Colors.cyan,),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.event_note_outlined, size: 38,),
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
                                            MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Update Data Jadwal",
                                              jadwal: listJadwal[position],
                                              id: listJadwal[position].id,
                                              // id_dosen: listDosen[position].id,
                                              // id_matkul: listMatkul[position].id,
                                            ))
                                        ).then(onGoBack);
                                      },
                                      child: Text("Update"),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 20,
                                    ),
                                    FlatButton(
                                        onPressed: () async {
                                          ApiServices().deleteJadwal(listJadwal[position].id);
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
                itemCount: listJadwal.length,
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
              MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal"))
          ).then(onGoBack);
        },
        child: Icon(Icons.add),
      ),
    );

  }
}