import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:flutter_progmob/UAS/Matakuliah/addMtk.dart';
import 'package:flutter_progmob/UAS/Matakuliah/readMtk.dart';
import 'package:flutter_progmob/UAS/Matakuliah/updateMtk.dart';

class DashboardMtk extends StatefulWidget {
  DashboardMtk({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardMtkState createState() => _DashboardMtkState();
}

class _DashboardMtkState extends State<DashboardMtk> {
  final _formkey = GlobalKey<FormState>();

  List<Matakuliah> lMtk = new List();

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
                  MaterialPageRoute(builder: (context) => addMtk(title: "Tambah Matakuliah",))
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatkul(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "something wrong : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done) {
            lMtk = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0,vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(lMtk[position].nama +" - "+ lMtk[position].kode),
                        subtitle: Text("SKS: "+lMtk[position].sks),
                        leading: Icon(
                          Icons.menu_book_sharp,
                          color: Colors.blue,
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => updateMtk(title: "Update MataKuliah",mtk: lMtk[position],kode_cari: lMtk[position].kode)),
                                        ).then(onGoBack);
                                      },
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 20,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    FlatButton(
                                      child: Text("Delete"),
                                      onPressed: () async{
                                        ApiServices().deleteMtk(lMtk[position].kode);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                    )
                                  ],
                                ),
                              )
                          );
                        },
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => readMtk(title: "Read Matakuliah",mtk: lMtk[position])),
                          );
                        },
                      ),
                    )
                );
              },
              itemCount: lMtk.length,
            );
          } else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
