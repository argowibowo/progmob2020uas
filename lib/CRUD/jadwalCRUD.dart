import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_aftuts/API/apiService.dart';
import 'package:progmob_aftuts/CRUD/tambahJadwal.dart';
import 'package:progmob_aftuts/model.dart';

class JadwalCRUD extends StatefulWidget {
  JadwalCRUD({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _JadwalCRUDState createState() => _JadwalCRUDState();
}

class _JadwalCRUDState extends State<JadwalCRUD> {
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
        title: Text("CRUD JADWAL"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahJadwal(title: "Input Data Jadwal"))
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
                  "Ada sesuatu yang janggal: ${snapshot.error.toString()}"
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
                                      // onPressed: (){
                                      //   Navigator.pop(context);
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(builder: (context) => UpdateMatakuliah(title: "Update Data Matakuliah",
                                      //           jadwal: listjadwal[position],
                                      //           kodecari: listjadwal[position].matkul))
                                      //   ).then(onGoBack);
                                      // },
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
