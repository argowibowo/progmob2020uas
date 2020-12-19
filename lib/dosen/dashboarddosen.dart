import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/model.dart';
import 'package:flutter_progmob2020/apiservices.dart';
import 'package:flutter_progmob2020/Dosen/adddosen.dart';
import 'package:flutter_progmob2020/Dosen/updatedosen.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List();

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
                  MaterialPageRoute(builder: (context) => AddDsn(title: "Tambah Data Dosen")),
                ).then(onGoBack);
              },
            )
          ]
      ),

      body: FutureBuilder(
        future: ApiServices().getDosen(),
        builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Terjadi Kesalahan Pada: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lDsn = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lDsn[position].nama + " - " + lDsn[position].nidn),
                      subtitle: Text(lDsn[position].email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(lDsn[position].foto),
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
                                        MaterialPageRoute(builder: (context) => UpdateDsn(title: "Update Dosen",
                                            dsn:lDsn[position], nidncari: lDsn[position].nidn)),
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
              itemCount: lDsn.length,
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