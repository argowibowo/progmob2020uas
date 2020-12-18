import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'package:progmob_setelah_uts_72180190/jadwal/addJadwal.dart';
import 'package:progmob_setelah_uts_72180190/jadwal/updateJadwal.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
  final _formkey = GlobalKey<FormState>();

  String baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();

  List<Jadwal> lJadwal = new List();
  List<Matakuliah> lMatkul = new List();
  List<Dosen> lDosen = new List();

  String idDosen = "";
  String id = "";

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
                    builder: (context) => AddJadwal(title: "Input Data Jadwal")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something Wrong With Message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            lJadwal = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin:
                  new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lJadwal[position].matkul +
                          " | " +
                          lJadwal[position].dosen),
                      subtitle: Text("Hari: " + lJadwal[position].hari + " | " + "Sesi: " + lJadwal[position].sesi + " | " + "SKS: " + lJadwal[position].sks),
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
                                                  UpdateJadwal(
                                                    title:
                                                    "Update Data Jadwal", id: lJadwal[position].id, jadwal: lJadwal[position],
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
                                          .deleteJadwal(lJadwal[position].id)
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
              itemCount: lJadwal.length,
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
