import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/jadwal/addJadwal.dart';
import 'package:progmob_flutter/jadwal/editJadwal.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';


class DashboardJadwal extends StatefulWidget{
  DashboardJadwal({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardJadwalState createState()=> _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal>{
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> listJadwal = new List(); //menampung data yg digenerate flutter

  //fungsi ngerefresh
  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          backgroundColor: Colors.deepPurpleAccent[100],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddJadwal(title:"Tambah Jadwal"))
              ).then(onGoBack);
            },
          )
        ],
      ),
      body:FutureBuilder(
          future: ApiServices().getJadwal(),
          builder:(BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done){
              listJadwal = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      child: Container(
                         child: ListTile(
                            title: Text(listJadwal[position].matkul + " - " + listJadwal[position].dosen),
                            subtitle: Text(listJadwal[position].hari + " - "
                                + listJadwal[position].sesi),
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:<Widget>[
                                        FlatButton(
                                          child: Text("Update"),
                                          onPressed: (){
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => EditJadwal(title: "Edit Jadwal", id: listJadwal[position].id, jadwal: listJadwal[position])),
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
                                            ApiServices().deleteJadwal(listJadwal[position].id);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                        )
                                      ],
                                    ),
                                  )
                              );
                            },
                          )
                      )
                  );
                },
                itemCount: listJadwal.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
