import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/adddosen.dart';
import 'package:flutter_app_1/apiservices.dart';
import 'package:flutter_app_1/model.dart';
import 'package:flutter_app_1/updatedosen.dart';


class dashboarddosen extends StatefulWidget {
  dashboarddosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboarddosenState createState()=> _dashboarddosenState();
}
class _dashboarddosenState extends State<dashboarddosen> {
  final _formKey = GlobalKey<FormState>();

  List<Dosen> lDosen= new List();

  //berfungsi ketika menginsert data baru dan akan merefresh data yang sudah di ubah
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
                  MaterialPageRoute(builder: (context)=> AddDosen(title :"Input Data Dosen")),
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
              lDosen = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card( /////////////copy nanti bagian card yang sudah dibuat minggu lalu
                    //elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      child: Container(
                        child: ListTile(
                          title: Text(lDosen[position].nama + " - " + lDosen[position].nidn),
                          subtitle: Text(lDosen[position].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lDosen[position].foto),
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
                                            MaterialPageRoute(builder: (context)=> UpdateDosen(title: "Input Data Dosen", dosen: lDosen[position], nidn_cari: lDosen[position].nidn)),
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
