import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Matakuliah/updatematkul.dart';
import 'package:flutter_app/apiservice.dart';
import 'package:flutter_app/model.dart';
import 'dart:async';
import 'addMatkul.dart';

class DashboardMkh extends StatefulWidget {
  DashboardMkh({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMkhState createState() => _DashboardMkhState();
}

class _DashboardMkhState extends State<DashboardMkh> {

  final _formkey = GlobalKey<FormState>();

  List<Matakuliah> lMatkul = new List();

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  String hariIndoToString(int hari) {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMatkul(title: "Tambah Data Matakuliah",)),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatakuliah(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Kesalahan: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            lMatkul = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                            lMatkul[position].nama + " - " + lMatkul[position].kode),
                        subtitle: Text(
                            "Hari : " + hariIndoToString(lMatkul[position].hari)
                                + "\nSesi : " + lMatkul[position].sesi.toString()
                                + "\nSKS : " + lMatkul[position].sks.toString()
                        ),
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
                                          MaterialPageRoute(builder: (context) => UpdateMatkul(title:"Edit Data Matakuliah",mtkl: lMatkul[position],kodecari: lMatkul[position].kode)),
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
                                            .deleteMtk(lMatkul[position].kode);
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
              itemCount: lMatkul.length,
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