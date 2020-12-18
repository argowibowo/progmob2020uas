import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/apiservices.dart';
import 'package:flutter_progmob_2020/Jadwal/addJadwal.dart';
import 'package:flutter_progmob_2020/model.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
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
        title: Text("Dashboard Jadwal"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal"))
              ).then(onGoBack);},
          )
        ],
      ),
      backgroundColor: Colors.yellow,
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Ada yang salah: ${snapshot.error.toString()}"
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