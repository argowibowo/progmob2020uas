import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/matakuliah/addmatkul.dart';
import 'package:flutter_app/matakuliah/updatematkul.dart';
import 'package:flutter_app/model.dart';



class DashboardMatkul extends StatefulWidget {
  DashboardMatkul({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatkulState createState()=> _DashboardMatkulState();
}
class _DashboardMatkulState extends State<DashboardMatkul> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> lMatkul= new List();

  //berfungsi ketika menginsert data baru dan akan merefresh data yang sudah di ubah
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
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> AddMatkul(title :"Input Data Matakuliah")),
                ).then(onGoBack);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getMatkul(),
          builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something Wrong With message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done){
              lMatkul = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card( /////////////copy nanti bagian card yang sudah dibuat minggu lalu
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lMatkul[position].nama + " - " + lMatkul[position].kode),
                          subtitle: Text(lMatkul[position].hari),

                          onLongPress: (){
                            showDialog(context: context,
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
                                            MaterialPageRoute(builder: (context)=> UpdateMatkul(title: "Input Data Matakuliah", matkul: lMatkul[position], kode_cari: lMatkul[position].kode)),
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
                                          ApiServices().deleteMatkul(lMatkul[position].kode);
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
            } else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}