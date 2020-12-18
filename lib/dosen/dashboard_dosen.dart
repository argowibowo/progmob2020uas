import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'package:flutter_72180200/dosen/adddosen.dart';
import 'package:flutter_72180200/dosen/updatedosen.dart';

class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen>{
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List(); //ketika panggil apiservice, ini utk menampung data yg digenerate flutter

  FutureOr onGoBack(dynamic value){ //ketika udah insert data, navigate ke halaman baru, klo goback akan refresh data barunya
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
                MaterialPageRoute(builder: (context) => AddDsn(title: "Input Data Dosen")),
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
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    shadowColor: Color(0xFF1565C0),
                    color: Colors.white,
                    child: Container(
                      /*decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF81D4FA),
                              Color(0xFFB3E5FC),
                              Color(0xFFE1F5FE)
                            ],
                          ),
                      ),*/
                      margin: EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                      child: ListTile(
                        title: Text(
                          lDsn[position].nama + " - NIDN " + lDsn[position].nidn,
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "E-Mail : " + lDsn[position].email,
                          style: TextStyle(
                            color: Colors.black38,
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
                                          MaterialPageRoute(builder: (context) => UpdateDsn(title: "Update Data Dosen", dsn: lDsn[position], nidncari: lDsn[position].nidn)),
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