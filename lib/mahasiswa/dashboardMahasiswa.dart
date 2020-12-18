import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/mahasiswa/addMahasiswa.dart';
import 'package:progmob_flutter/mahasiswa/editMahasiswa.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';


class DashboardMahasiswa extends StatefulWidget{
  DashboardMahasiswa({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardMahasiswaState createState()=> _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa>{
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> listMhs = new List(); //menampung data yg digenerate flutter

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
        backgroundColor: Colors.deepPurpleAccent[100],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddMahasiswa(title:"Tambah Mahasiswa"))
              ).then(onGoBack);
              },
          )
        ],
      ),
      body:FutureBuilder(
        future: ApiServices().getMahasiswa(),
        builder:(BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot){
          if (snapshot.hasError){
            return Center(
              child: Text(
                "Something wrong with message: ${snapshot.error.toString()}"),
              );
          } else if (snapshot.connectionState == ConnectionState.done){
            listMhs = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position) {
            return Card(
                margin: new EdgeInsets.symmetric(
                    horizontal: 5.0, vertical: 1.0),
                child: Container(
                    child: ListTile(
                      title: Text(listMhs[position].nama + " - " +
                          listMhs[position].nim),
                      subtitle: Text(listMhs[position].email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(listMhs[position].foto),
                      ),
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
                                  MaterialPageRoute(builder: (context) => EditMahasiswa(title:"Edit Data Mahasiswa",
                                       mhs: listMhs[position], nimCari: listMhs[position].nim
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
                                    ApiServices().deleteMhs(listMhs[position].nim);
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
          itemCount: listMhs.length,
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
