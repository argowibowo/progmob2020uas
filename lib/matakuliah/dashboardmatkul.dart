import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/apiservices.dart';
import 'package:flutter_progmob/main.dart';
import 'package:flutter_progmob/matakuliah/addmatkul.dart';
import 'package:flutter_progmob/matakuliah/updatematkul.dart';
import 'package:flutter_progmob/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMataKuliah extends StatefulWidget {
  DashboardMataKuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMataKuliahState createState() => _DashboardMataKuliahState();
}

class _DashboardMataKuliahState extends State<DashboardMataKuliah> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> lMatkul = new List();

  FutureOr onGoBack(dynamic value) {
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
                    MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Mata Kuliah")),
                  ).then(onGoBack);
                },
              )
            ]
        ),
        body: FutureBuilder(
            future: ApiServices().getMatakuliah(),
            builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              }else if (snapshot.connectionState == ConnectionState.done) {
                lMatkul = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                        child: Container(
                          child:ListTile(
                            title: Text(lMatkul[position].hari + " - " + lMatkul[position].kodeMataKuliah),
                            subtitle: Text(lMatkul[position].dosen),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(lMatkul[position].foto),
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
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UpdateMatkul(title: "Input Data Mata Kuliah", matkul: lMatkul[position], kodematakuliahcari: lMatkul[position].kodeMataKuliah)),
                                            ).then(onGoBack);
                                          },
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          height: 20,
                                        ),
                                        FlatButton(
                                          child: Text("Delete"),
                                          onPressed: () async {
                                            ApiServices().deleteMatkul(lMatkul[position].kodeMataKuliah);
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
              }else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
    );
  }
}