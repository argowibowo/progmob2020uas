import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/dosen/adddsn.dart';
import 'package:flutter_app/dosen/updatedsn.dart';
import 'package:flutter_app/model.dart';



class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDsnState createState()=> _DashboardDsnState();
}
class _DashboardDsnState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDsn= new List();

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
                  MaterialPageRoute(builder: (context)=> AddDsn(title :"Input Data Dosen")),
                ).then(onGoBack);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getDosen(),
          builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something Wrong With message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done){
              lDsn = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card( /////////////copy nanti bagian card yang sudah dibuat minggu lalu
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lDsn[position].nama + " - " + lDsn[position].nidn),
                          subtitle: Text(lDsn[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lDsn[position].foto),
                          ),
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
                                            MaterialPageRoute(builder: (context)=> UpdateDsn(title: "Input Data Dosen", dsn: lDsn[position], nidncari: lDsn[position].nidn)),
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
                                          ApiServices().deleteDsn(lDsn[position].nidn);
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
                itemCount: lDsn.length,
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