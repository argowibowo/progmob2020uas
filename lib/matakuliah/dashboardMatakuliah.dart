import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/matakuliah/addMatakuliah.dart';
import 'package:progmob_flutter/matakuliah/editMatakuliah.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';


class DashboardMatakuliah extends StatefulWidget{
  DashboardMatakuliah({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardMatakuliahState createState()=> _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah>{
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> listMatkul = new List(); //menampung data yg digenerate flutter

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
        backgroundColor: Colors.deepPurple[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddMatakuliah(title:"Tambah Matakuliah"))
              ).then(onGoBack);
            },
          )
        ],
      ),
      body:FutureBuilder(
          future: ApiServices().getMatakuliah(),
          builder:(BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done){
              listMatkul = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      child: Container(
                          child: ListTile(
                            title: Text(listMatkul[position].nama),
                            subtitle: Text("["+listMatkul[position].kode + "] - "
                            + listMatkul[position].hari + ", " + listMatkul[position].sesi),
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
                                              MaterialPageRoute(builder: (context) => EditMatakuliah(title:"Edit Data Matakuliah",
                                                  matkul: listMatkul[position], kode_cari: listMatkul[position].kode
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
                                            ApiServices().deleteMatkul(listMatkul[position].kode);
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
                itemCount: listMatkul.length,
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
