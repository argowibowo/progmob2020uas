import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/apiservices.dart';
import 'package:progmob2020_flutter/matakuliah/addmatakuliah.dart';
import 'package:progmob2020_flutter/matakuliah/updatematakuliah.dart';
import 'package:progmob2020_flutter/model.dart';


class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
  final _formKey = GlobalKey<FormState>();

  List<Matakuliah> lMatkul = new List();

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
            icon: Icon(Icons.playlist_add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMatakuliah(title: "Tambah Data Matakuliah")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMatakuliah(),
        builder: (BuildContext context, AsyncSnapshot<List<Matakuliah>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Something Wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lMatkul = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      leading: Icon(Icons.menu_book_outlined),
                      title: Text(lMatkul[position].nama),
                      subtitle: Text(lMatkul[position].kode + " -"+ lMatkul[position].hari +" "+lMatkul[position].sesi),
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
                                        MaterialPageRoute(builder: (context) => UpdateMatkul(title: "Update Matakuliah",
                                            matkul:lMatkul[position], kodecari: lMatkul[position].kode)),
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
                                        ApiServices().deleteMatkul(lMatkul[position].kode);
                                        Navigator.pop(context);
                                        setState(() {});
                                      })
                                ],
                              ),
                            )
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: lMatkul.length,
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