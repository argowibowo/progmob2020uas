import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/Mahasiswa/addmhs.dart';
import 'package:flutter_app/Mahasiswa/updatemhs.dart';
import 'package:flutter_app/matakuliah/updatemk.dart';
import 'package:flutter_app/model.dart';

import 'addmk.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
  final _formkey = GlobalKey<FormState>();
  List<Matakuliah> lMk = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMk(title: "Input Data Matakuliah")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatakuliah(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Something Wrong With Meessage Matakuliah : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done){
            lMk = snapshot.data;
            return ListView.builder(
              itemBuilder:(context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 05, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title:Text(lMk[position].nama + " - " + lMk[position].kode),
                      subtitle: Text("Hari ke - " + lMk[position].hari + " || Sesi " + lMk[position].sesi + " || " + lMk[position].sks + " SKS"),
                      onLongPress: (){
                        showDialog(
                            context:  context,
                            builder: (_) => new AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children:<Widget>[
                                  FlatButton(
                                    child: Text("Update"),
                                    onPressed:(){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UpdateMk(title: "Update Data Matakuliah", mk: lMk[position], kodecari: lMk[position].kode)),
                                      ).then(onGoBack);
                                    },
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                  ),
                                  FlatButton(
                                    child: Text("Delete"),
                                    onPressed:() async {
                                      ApiServices().deleteMk(lMk[position].kode);
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: lMk.length,
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