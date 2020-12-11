import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'package:progmob_setelah_uts_72180190/mahasiswa/updateMhs.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'addMhs.dart';

class DashboardMahasiswa extends StatefulWidget {
  DashboardMahasiswa({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  final _formkey = GlobalKey<FormState>();

  List<Mahasiswa> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
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
              child: Text(
                "Something Wrong With Message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lMhs = snapshot.data;
            return ListView.builder(itemBuilder: (context, position){
              return Card(
                margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Container(
                  child: ListTile(
                    title: Text(lMhs[position].nama + " - " + lMhs[position].nim),
                    subtitle: Text(lMhs[position].email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(lMhs[position].foto),
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
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>UpdateMhs(title: "Update Data Mahasiswa", mhs: lMhs[position], nimcari: lMhs[position].nim,))
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
