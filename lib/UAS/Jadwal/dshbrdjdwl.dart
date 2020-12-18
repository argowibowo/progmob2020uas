import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:flutter_progmob/UAS/Jadwal/addJadwal.dart';
import 'package:flutter_progmob/UAS/Jadwal/readJadwal.dart';
import 'package:flutter_progmob/UAS/Jadwal/updateJadwal.dart';
import 'package:flutter_progmob/UAS/Matakuliah/addMtk.dart';
import 'package:flutter_progmob/UAS/Matakuliah/readMtk.dart';
import 'package:flutter_progmob/UAS/Matakuliah/updateMtk.dart';

class DashboardJdwl extends StatefulWidget {
  DashboardJdwl({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardJdwlState createState() => _DashboardJdwlState();
}

class _DashboardJdwlState extends State<DashboardJdwl> {
  final _formkey = GlobalKey<FormState>();

  List<Jadwal> lJdw = new List();

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
                  MaterialPageRoute(builder: (context) => addJdwl(title: "Tambah Jadwal",))
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getJadwal(),
        builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "something wrong : ${snapshot.error.toString()}"),
            );
          }else if(snapshot.connectionState == ConnectionState.done) {
            lJdw = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0,vertical: 1.0),
                    child: Container(
                      child: ListTile(
                        title: Text(lJdw[position].matkul +" - "+ lJdw[position].dosen),
                        subtitle: Text("hari: "+lJdw[position].hari+ " - "+"sesi: "+lJdw[position].sesi),
                        leading: Icon(
                          Icons.calendar_today_outlined,
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
                                          MaterialPageRoute(builder: (context) => updateJdwl(title: "Update Jadwal",id: lJdw[position].id,)),
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
                                        ApiServices().deleteJadwal(lJdw[position].id);
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
                            MaterialPageRoute(builder: (context) => readJdwl(title: "Read Jadwal",jdwl: lJdw[position])),
                          );
                        },
                      ),
                    )
                );
              },
              itemCount: lJdw.length,
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
