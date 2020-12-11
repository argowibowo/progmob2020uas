import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formkey = GlobalKey<FormState>();

  List<Dosen> lDsn = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {},
          )
        ],
      ),

      body: FutureBuilder(
        future: ApiServices().getDosen(),
        builder: (BuildContext context, AsyncSnapshot<List<Dosen>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Something Wrong With Message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lDsn = snapshot.data;
            return ListView.builder(itemBuilder: (context, position){
              return Card(
                margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Container(
                  child: ListTile(
                    title: Text(lDsn[position].nama + " - " + lDsn[position].nidn),
                    subtitle: Text(lDsn[position].email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(lDsn[position].foto),
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
                                  // onPressed: (){
                                  //   Navigator.pop(context);
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context)=>UpdateMhs(title: "Update Data Mahasiswa", mhs: lMhs[position], nimcari: lMhs[position].nim,))
                                  //   ).then(onGoBack);
                                  // },
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 20,
                                ),
                                FlatButton(
                                  child: Text("Delete"),
                                  onPressed: () async{
                                    ApiServices().deleteMhs(lDsn[position].nidn);
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
              itemCount: lDsn.length,
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
