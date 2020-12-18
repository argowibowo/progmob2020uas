import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/apiservices.dart';
import 'package:progmob_flutter_2020/dosen/addDosen.dart';
import 'package:progmob_flutter_2020/dosen/updateDosen.dart';
import 'package:progmob_flutter_2020/model.dart';


class DashBoardDosen extends StatefulWidget {
  DashBoardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardDosenState createState() => _DashBoardDosenState();
}

class _DashBoardDosenState extends State<DashBoardDosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDosen = new List();

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
                  MaterialPageRoute(builder: (context) => AddDosen(title: "Input Data Dosen")),
                ).then(onGoBack);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getDosen(),
          builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lDosen = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lDosen[position].nama + " " + lDosen[position].gelar +" - " + lDosen[position].nidn),
                          subtitle: Text(lDosen[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lDosen[position].foto),
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
                                            MaterialPageRoute(builder: (context) => UpdateDosen(title: "Input Data Dosen", dosen:lDosen[position], nidncari: lDosen[position].nidn)),
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
                                          ApiServices().deleteDosen(lDosen[position].nidn);
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
                itemCount: lDosen.length,
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
