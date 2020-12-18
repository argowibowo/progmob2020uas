import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluter_hello_world/matakuliah/AddMatakuliah.dart';
import 'package:fluter_hello_world/matakuliah/UpdateMatakuliah.dart';
import 'package:fluter_hello_world/model.dart';
import 'package:fluter_hello_world/apiservices.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {

  List<MataKuliah> lMtk = new List();

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
                  MaterialPageRoute(builder: (context) => AddMatakuliah(title: "Tambah Data Matakuliah")),
                ).then(onGoBack);
              },
            )
          ]
      ),
      body: FutureBuilder(
        future: ApiServices().getMatakuliah(),
        builder: (BuildContext context, AsyncSnapshot<List<MataKuliah>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Something Wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lMtk = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lMtk[position].nama + " - " + lMtk[position].kode),
                      subtitle: Text(
                          "Hari : " + hariIndo(lMtk[position].hari)
                              + "\nSesi : " + lMtk[position].sesi.toString()
                              + "\nSKS : " + lMtk[position].sks.toString()
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
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UpdateMatakuliah(title: "Update Matakuliah",
                                            mtk:lMtk[position], kodecari: lMtk[position].kode)),
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
                                        ApiServices().deleteMtk(lMtk[position].kode);
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
              itemCount: lMtk.length,
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