import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2020/apiservices.dart';
import 'package:flutter_2020/jadwal/addjadwal.dart';
import 'package:flutter_2020/jadwal/updatejadwal.dart';
import 'package:flutter_2020/model.dart';


class DashBoardJadwal extends StatefulWidget {
  DashBoardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardJadwalState createState() => _DashBoardJadwalState();
}

class _DashBoardJadwalState extends State<DashBoardJadwal> {
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> lJadwal = new List();

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
                  MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal Kuliah")),
                ).then(onGoBack);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: ApiServices().getJadwal(),
          builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with this message: ${snapshot.error.toString()}"),
              );
            }else if (snapshot.connectionState == ConnectionState.done) {
              lJadwal = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lJadwal[position].matkul + " " + lJadwal[position].dosen +" - " + lJadwal[position].sesi),
                          subtitle: Text(lJadwal[position].hari),
                          //subtitle: Text(lJadwal[position].hari),
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
                                            MaterialPageRoute(builder: (context) => UpdateJdwl(title: "Update Data", id: lJadwal[position].id)),
                                          ).then(onGoBack);
                                        },
                                      ),
                                      Divider(
                                        color: Colors.yellow,
                                        height: 20,
                                      ),
                                      FlatButton(
                                        child: Text("Delete"),
                                        onPressed: () async{
                                          ApiServices().deleteJadwal(lJadwal[position].id);
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
                itemCount: lJadwal.length,
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