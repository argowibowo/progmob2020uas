import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/apiservices.dart';
import 'package:progmob_flutter_2020/mahasiswa/addMhs.dart';
import 'package:progmob_flutter_2020/mahasiswa/updateMhs.dart';
import 'package:progmob_flutter_2020/model.dart';


class DashBoardMhs extends StatefulWidget {
  DashBoardMhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardMhsState createState() => _DashBoardMhsState();
}

class _DashBoardMhsState extends State<DashBoardMhs> {
  final _formKey = GlobalKey<FormState>();

  List<Mhs> lMhs = new List();

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
                  MaterialPageRoute(builder: (context) => AddMhs(title: "Input Data Mahasiswa")),
                ).then(onGoBack);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getMhss(),
          builder: (BuildContext context, AsyncSnapshot<List<Mhs>> snapshot){
            if (snapshot.hasError) {
              return Center(
              child: Text(
              "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lMhs = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                  //elevation: 8.0,
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                    child: Container(
                      child: ListTile(
                    title: Text(lMhs[position].nama + " - " + lMhs[position].nim),
                    subtitle: Text(lMhs[position].email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(lMhs[position].foto),
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
                                  MaterialPageRoute(builder: (context) => UpdateMhs(title: "Input Data Mahasiswa", mahasiswa:lMhs[position], nimcari: lMhs[position].nim)),
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
                                ApiServices().deleteMhs(lMhs[position].nim);
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
                itemCount: lMhs.length,
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
