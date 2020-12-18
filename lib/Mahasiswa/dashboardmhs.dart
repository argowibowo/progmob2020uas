import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/apiservice.dart';
import 'package:flutter_app/Mahasiswa/addmhs.dart';
import 'package:flutter_app/Mahasiswa/updatemhs.dart';
import 'package:flutter_app/model.dart';

class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formkey = GlobalKey<FormState>();
  List<Mahasiswa> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions:<Widget>[
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
        future: ApiServices().getMahasiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Something Wrong With Meessage : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done){
            lMhs = snapshot.data;
            return ListView.builder(
              itemBuilder:(context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 05, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title:Text(lMhs[position].nama + "-" + lMhs[position].nim),
                      subtitle: Text(lMhs[position].email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(lMhs[position].foto),
                      ),
                      onLongPress: (){
                        showDialog(
                          context:  context,
                          builder: (_) => new AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:<Widget>[
                                FlatButton(
                                  child: Text("Update"),
                                  onPressed:(){
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                        MaterialPageRoute(builder: (context) => UpdateMhs(title: "Update Data Mahasiswa", mhs : lMhs[position], nimcari: lMhs[position].nim)),
                                      ).then(onGoBack);
                                  },
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 20,
                                ),
                                FlatButton(
                                  child: Text("Delete"),
                                    onPressed:() async{
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
                  ),
                );
              },
              itemCount: lMhs.length,
            );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


/*child:  Column(
mainAxisSize: MainAxisSize.min,
children:<Widget>[
ListTile(
leading: Icon(Icons.person),
title:Text("Yose Awanaustus Salawangi"),
subtitle: Text("72180217 - yose.asalawangi@si.ukdw.ac.id"),
trailing: PopupMenuButton(
itemBuilder: (_) => <PopupMenuItem<String>>[
new PopupMenuItem<String>(
child: const Text('Update'), value: 'Update'),
new PopupMenuItem<String>(
child: const Text('Delete'), value: 'Delete'),
],
)
)
],
)*/