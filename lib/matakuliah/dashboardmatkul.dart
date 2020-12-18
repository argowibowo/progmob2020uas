import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/apiservices.dart';
import 'package:progmob_flutter_2020/matakuliah/addMatkul.dart';
import 'package:progmob_flutter_2020/matakuliah/updateMatkul.dart';
import 'package:progmob_flutter_2020/model.dart';


class DashBoardMatkul extends StatefulWidget {
  DashBoardMatkul({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardMatkulState createState() => _DashBoardMatkulState();
}

class _DashBoardMatkulState extends State<DashBoardMatkul> {
  final _formKey = GlobalKey<FormState>();

  List<Matkul> lMatkul = new List();

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
                  MaterialPageRoute(builder: (context) => AddMatkul(title: "Input Data Mata Kuliah")),
                ).then(onGoBack);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getMatkul(),
          builder: (BuildContext context, AsyncSnapshot<List<Matkul>> snapshot){
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lMatkul = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lMatkul[position].kode + " " + lMatkul[position].nama +" - " + lMatkul[position].sks),
                          subtitle: Text(lMatkul[position].hari),
                          leading: Icon(Icons.book_outlined),
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
                                            MaterialPageRoute(builder: (context) => UpdateMatkul(title: "Input Data Mata Kuliah", matkul:lMatkul[position], kode_cari: lMatkul[position].kode)),
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
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}
