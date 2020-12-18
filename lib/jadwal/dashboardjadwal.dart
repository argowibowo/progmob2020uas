import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/apiservices.dart';
import 'package:flutter_progmob/jadwal/addjadwal.dart';
import 'package:flutter_progmob/jadwal/updatejadwal.dart';
import 'package:flutter_progmob/main.dart';
import 'package:flutter_progmob/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> lJdl = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal")),
                  ).then(onGoBack);
                },
              )
            ]
        ),
        body: FutureBuilder(
            future: ApiServices().getJadwal(),
            builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              }else if (snapshot.connectionState == ConnectionState.done) {
                lJdl = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                        child: Container(
                          child:ListTile(
                            title: Text(lJdl[position].matkul + " - " + lJdl[position].idjadwal),
                            subtitle: Text(lJdl[position].dosen),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(lJdl[position].foto),
                            ),
                            onLongPress: (){
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
                                              MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Input Data Jadwal", jdl: lJdl[position], idjadwalcari: lJdl[position].idjadwal)),
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
                                            ApiServices().deleteJadwal(lJdl[position].idjadwal);
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
                  itemCount: lJdl.length,
                );
              }else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
    );
  }
}