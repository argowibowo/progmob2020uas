import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/mahasiswa/AddMhs.dart';
import 'package:flutter_progmob_app/mahasiswa/updateMhs.dart';

import '../apiservice.dart';
import '../model.dart';
class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> mhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> AddMhs(title: "Masukkan data")),
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
              mhs = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card( /////////////copy nanti bagian card yang sudah dibuat minggu lalu
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(mhs[position].nama + " - " + mhs[position].nim),
                          subtitle: Text(mhs[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(mhs[position].foto),
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
                                            MaterialPageRoute(builder: (context)=> UpdateMhs(title: "Input Data Mahasiswa", mhs: mhs[position], nimcari: mhs[position].nim)),
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
                                          ApiServices().deleteMhs(mhs[position].nim);
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
                itemCount: mhs.length,
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