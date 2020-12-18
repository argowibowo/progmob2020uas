import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_aftuts/API/apiService.dart';
import 'package:progmob_aftuts/CRUD/tambahMahasiswa.dart';
import 'package:progmob_aftuts/CRUD/updateMahasiswa.dart';
import 'package:progmob_aftuts/model.dart';
// Batas SEBELUM UAS

class MahasiswaCRUD extends StatefulWidget {
  MahasiswaCRUD({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MahasiswaCRUDState createState() => _MahasiswaCRUDState();
}

class _MahasiswaCRUDState extends State<MahasiswaCRUD> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> listMahasiswa;

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
        title: Text("CRUD MAHASISWA"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahMahasiswa(title: "Input Data Mahasiswa"))
              ).then(onGoBack);},
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMahasiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Ada sesuatu yang janggal: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            listMahasiswa = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, position) {
                return SafeArea(
                  child: Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(listMahasiswa[position].nama + " - " + listMahasiswa[position].nim),
                        subtitle: Text(listMahasiswa[position].email),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(listMahasiswa[position].foto),
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
                                              MaterialPageRoute(builder: (context) => UpdateMahasiswa(title: "Update Data Mahasiswa",
                                                  mhs: listMahasiswa[position],
                                                  nimcari: listMahasiswa[position].nim))
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
                                          ApiServices().deleteMhs(listMahasiswa[position].nim);
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
                  ),
                );
              },
              itemCount: listMahasiswa.length,
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
