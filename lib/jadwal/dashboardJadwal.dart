import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'addJadwal.dart';
import 'updateJadwal.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {

  List<Jadwal> lJdwl = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  String hariIndo(int hari) {
    switch(hari) {
      case 1:
        return "Senin";
        break;
      case 2:
        return "Selasa";
        break;
      case 3:
        return "Rabu";
        break;
      case 4:
        return "Kamis";
        break;
      case 5:
        return "Jumat";
        break;
      case 6:
        return "Sabtu";
        break;
      case 7:
        return "Minggu";
        break;
      default:
        return "Hari";
        break;

    }
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
                  MaterialPageRoute(builder: (context) => AddJadwal(title: "Tambah Data Jadwal")),
                ).then(onGoBack);
              },
            )
          ]
      ),

      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Kesalahan: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lJdwl = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lJdwl[position].dosen + " - " + lJdwl[position].matkul),
                      subtitle: Text(
                          "NIDN : " + lJdwl[position].nidn
                              + "\nHari : " + hariIndo(lJdwl[position].hari)
                              + "\nSesi : " + lJdwl[position].sesi.toString()
                              + "\nSKS : " + lJdwl[position].sks.toString()
                      ),
                      onLongPress: (){
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("UPDATE"),
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Edit Data Jadwal",
                                            jdwl:lJdwl[position], idJdwl: lJdwl[position].id)),
                                      ).then(onGoBack);
                                    },
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                  ),
                                  FlatButton(
                                      child: Text("DELETE"),
                                      onPressed: () async{
                                        ApiServices().deleteJadwal(lJdwl[position].id);
                                        Navigator.pop(context);
                                        setState(() {});
                                      })
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: lJdwl.length,
            );
          } else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}