import 'dart:async';
import 'package:andre_fapp/Dosen/adddosen.dart';
import 'package:andre_fapp/Dosen/updatedosen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:andre_fapp/apiservice.dart';
import 'package:andre_fapp/model.dart';
import 'package:andre_fapp/dosen/adddosen.dart';
import 'package:andre_fapp/dosen/updatedosen.dart';

class Dsn extends StatefulWidget {
  Dsn({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DsnState createState() => _DsnState();
}

class _DsnState extends State<Dsn> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> listDosen;

  FutureOr onGoBack(dynamic value) {
    setState(() {

    });
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
        backgroundColor: Colors.brown[700],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDsn(title: "Input Data Dosen"))
                ).then(onGoBack);
              }
          )
        ],
      ),
      backgroundColor: Colors.white,


      body: FutureBuilder(
        future: ApiServices().getDosen(),
        builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listDosen = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(listDosen[position].nama + ", " + listDosen[position].gelar),
                      subtitle: Text(listDosen[position].nidn + " - " + listDosen[position].email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(listDosen[position].foto),
                      ),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UpdateDosen(title: "Update Data Dosen",
                                                dosen: listDosen[position],
                                                nidncari: listDosen[position].nidn))
                                        ).then(onGoBack);
                                      },
                                      child: Text("Update")
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                  ),
                                  FlatButton(
                                      onPressed: () async {
                                        ApiServices().deleteDosen(listDosen[position].nidn);
                                        Navigator.pop(context);
                                        setState(() {

                                        });
                                      },
                                      child: Text("Delete")
                                  ),
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: listDosen.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}