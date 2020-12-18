import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world_flutter/apiservice.dart';
import 'package:hello_world_flutter/dosen/adddosen.dart';
import 'package:hello_world_flutter/dosen/updatedosen.dart';
import 'package:hello_world_flutter/model.dart';

class dashboardDosen extends StatefulWidget {
  dashboardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboardDosenState createState()=> _dashboardDosenState();
}
class _dashboardDosenState extends State<dashboardDosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> listDosen= new List();

  //Insert data -> Refresh data yg sudah diubah
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
                  MaterialPageRoute(builder: (context)=> addDosen(title :"Input Data Dosen")),
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
              listDosen = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(listDosen[position].nama + " - " + listDosen[position].nidn),
                          subtitle: Text(listDosen[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(listDosen[position].foto),
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
                                            MaterialPageRoute(builder: (context)=> updateDosen(title: "Input Data Dosen", dosen: listDosen[position], nidncari: listDosen[position].nidn)),
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
                                          ApiServices().deleteDosen(listDosen[position].nidn);
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
                itemCount: listDosen.length,
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