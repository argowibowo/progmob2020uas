import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/CRUD/jadwal/UpdateJadwal.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/CRUD/jadwal/AddJadwal.dart';
import 'package:flutter_app/model.dart';

class DashboardDataJadwal extends StatefulWidget {
  DashboardDataJadwal({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardDataJadwalState createState() => _DashboardDataJadwalState();
}

class _DashboardDataJadwalState extends State<DashboardDataJadwal> {
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> listjadwal;

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
        title: Text("Menu Data Jadwal"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddJadwal(title: "Tambah Data Jadwal"))
              ).then(onGoBack);},
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Data Error: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listjadwal = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(listjadwal[position].id_matkul + " - " + listjadwal[position].id_dosen),
                      subtitle: Text("NIDN : " + listjadwal[position].nidn.toString() + " - Hari " + listjadwal[position].hari.toString() + " - Sesi "
                          + listjadwal[position].sesi.toString()
                          + " - SKS : " + listjadwal[position].sks.toString()),
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
                                          MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Update Data Matakuliah",
                                             // Jadwal: listjadwal[position],
                                              kodecari: listjadwal[position].id_matkul))
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
                                        ApiServices().deleteMatkul(listjadwal[position].id_matkul);
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
              itemCount: listjadwal.length,
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