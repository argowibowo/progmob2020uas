import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/apiservices.dart';
import 'package:progmob2020_flutter/jadwal/addjadwal.dart';
import 'package:progmob2020_flutter/jadwal/updatejadwal.dart';
import 'package:progmob2020_flutter/model.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddJadwal(title: "Tambah Data Jadwal")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Something Wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lJadwal = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      leading: Icon(Icons.menu_book_outlined),
                      title: Text(lJadwal[position].id_matkul +" - "+ lJadwal[position].id_dosen),
                      subtitle: Text(lJadwal[position].hari +" || "+ lJadwal[position].sesi),
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
                                        MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Update Jadwal",
                                            jadwal: lJadwal[position],kodecari: lJadwal[position].id_matkul)),
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
                                        ApiServices().deleteJadwal(lJadwal[position].id_matkul);
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
              itemCount: lJadwal.length,
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