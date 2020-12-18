import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/jadwal/addJadwal.dart';
import 'package:flutter_app/jadwal//updateJadwal.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
  final _formKey = GlobalKey<FormState>();
  List<Jadwal> lJadwal = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  //int _counter = 2;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

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
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard())
                );
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getJadwal(),
          builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lJadwal = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lJadwal[position].matkul+ " - " + lJadwal[position].dosen),
                          subtitle: Text(lJadwal[position].nidn.toString() + " - " + lJadwal[position].hari.toString() + " - " + lJadwal[position].sesi.toString() + " - " + lJadwal[position].sks.toString()),
                          onLongPress: (){
                            showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text("Update"),
                                        onPressed: (){
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Update Data Jadwal", jadwal:lJadwal[position], id_dosen: lJadwal[position].id_dosen, id_matkul: lJadwal[position].id_matkul))
                                          ).then(onGoBack);
                                        },
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        height: 20,
                                      ),
                                      FlatButton(
                                        child: Text("Delete"),
                                        onPressed: () async{
                                          ApiServices().deleteJadwal();
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      )
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
        )
    );
  }
}