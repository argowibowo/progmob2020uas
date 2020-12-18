import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baru1/model.dart';
import 'package:baru1/apiservices.dart';
import 'package:baru1/Dosen/addDosen.dart';
import 'package:baru1/Dosen/updateDosen.dart';

class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen>{
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {}); //refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addDosen(title: "Input Data Dosen")),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: ApiServices().getDosens(),
          builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text(
                  "Something wrong with message : ${snapshot.error.toString()}",
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }else if(snapshot.connectionState == ConnectionState.done){
              lDsn = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position){
                  return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                          lDsn[position].nama + " - " + lDsn[position].nidn,
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          lDsn[position].email,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
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
                                      child: Text(
                                        "Update",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context);
                                        //pindah ke menu update
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UpdateDosen(title: "Update Data Dosen", dsn: lDsn[position], nidncari: lDsn[position].nidn)),
                                        ).then(onGoBack);
                                      },
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 20,
                                    ),
                                    FlatButton(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: (){
                                        ApiServices().deleteDsn(lDsn[position].nidn);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
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
                itemCount: lDsn.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                  backgroundColor: Colors.grey,
                  strokeWidth: 7,
                ),
              );
            }
          }
      ),
    );
  }
}

UpdateDosen({String title, Dosen dsn, String nidncari}) {
}



addDosen({String title}) {
}

