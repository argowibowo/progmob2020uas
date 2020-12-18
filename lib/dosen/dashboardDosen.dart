import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/dosen/AddDosen.dart';
import 'package:progmob_flutter/dosen/editDosen.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';


class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardDosenState createState()=> _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen>{
  final _formKey = GlobalKey<FormState>();

  List<Dosen> listDsn = new List(); //menampung data yg digenerate flutter

  //fungsi ngerefresh
  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          backgroundColor: Colors.deepPurpleAccent[100],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDosen(title:"Tambah Dosen"))
              ).then(onGoBack);
            },
          )
        ],
      ),
      body:FutureBuilder(
          future: ApiServices().getDosen(),
          builder:(BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done){
              listDsn = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      child: Container(
                          child: ListTile(
                            title: Text(listDsn[position].nama +", "+ listDsn[position].gelar + " - " +
                                listDsn[position].nidn),
                            subtitle: Text(listDsn[position].email),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(listDsn[position].foto),
                            ),
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:<Widget>[
                                        FlatButton(
                                          child: Text("Update"),
                                          onPressed: (){
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => EditDosen(title:"Edit Data Dosen",
                                                  dsn: listDsn[position], nidnCari: listDsn[position].nidn
                                              )),
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
                                            ApiServices().deleteDsn(listDsn[position].nidn);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                        )
                                      ],
                                    ),
                                  )
                              );
                            },
                          )
                      )
                  );
                },
                itemCount: listDsn.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
