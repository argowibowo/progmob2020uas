import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/matakuliah/updatematkul.dart';

import '../apiservices.dart';
import '../model.dart';
import 'addmatkul.dart';

class DashboardMatakuliah extends StatefulWidget{
  DashboardMatakuliah({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah>{
  final _formKey = GlobalKey<FormState>();

  List<Matkul> lMatkul = new List(); //ketika panggil apiservice, ini utk menampung data yg digenerate flutter

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
                MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Matakuliah")),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: ApiServices().getMatkuls(),
          builder: (BuildContext context, AsyncSnapshot<List<Matkul>> snapshot){
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
              lMatkul = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position){
                  return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                          lMatkul[position].nama + " - " + lMatkul[position].kode,
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Hari " + lMatkul[position].hari.toString() + " - Sesi " + lMatkul[position].sesi.toString()
                          + " - SKS " + lMatkul[position].sks.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFF0D47A1),
                          child: Icon(
                            Icons.menu_book_sharp,
                            color: Colors.white,
                          ),
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
                                          MaterialPageRoute(builder: (context) => UpdateMatkul(title: "Update Data Matakuliah", mk: lMatkul[position], kodecari: lMatkul[position].kode)),
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
                                        ApiServices().deleteMatkul(lMatkul[position].kode);
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
                itemCount: lMatkul.length,
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