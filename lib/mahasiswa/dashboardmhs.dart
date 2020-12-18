import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world_flutter/apiservice.dart';
import 'package:hello_world_flutter/mahasiswa/addmhs.dart';
import 'package:hello_world_flutter/mahasiswa/updatemhs.dart';
import 'package:hello_world_flutter/model.dart';

class dashboardMhs extends StatefulWidget {
  dashboardMhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboardMhsState createState()=> _dashboardMhsState();
}
class _dashboardMhsState extends State<dashboardMhs> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> listMhs= new List();

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
                  MaterialPageRoute(builder: (context)=> addMhs(title :"Input Data Mahasiswa")),
                ).then(onGoBack);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getMahasiswa(),
          builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something Wrong With message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done){
              listMhs = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(listMhs[position].nama + " - " + listMhs[position].nim),
                          subtitle: Text(listMhs[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(listMhs[position].foto),
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
                                            MaterialPageRoute(builder: (context)=> UpdateMhs(title: "Input Data Mahasiswa", mhs: listMhs[position], nimcari: listMhs[position].nim)),
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
                                          ApiServices().deleteMhs(listMhs[position].nim);
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
                itemCount: listMhs.length,
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