import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_72180247/dosen/addDosen.dart';
import 'package:flutter_72180247/dosen/updateDosen.dart';
import 'package:flutter_72180247/model.dart';
import 'package:flutter_72180247/apiservice.dart';
import 'package:flutter/material.dart';

class Dashboard_dosen extends StatefulWidget {
  Dashboard_dosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Dashboard_dosenState createState() => _Dashboard_dosenState();
}

class _Dashboard_dosenState extends State<Dashboard_dosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> listDosen;

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff4d4d),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDosen(title: "Tambah Dosen"))
                ).then(onGoBack);
              }
          )
        ],
      ),

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