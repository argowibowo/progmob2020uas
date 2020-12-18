import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/matakuliah/addmatkul.dart';
import 'package:progmob_flutter/matakuliah/updatematkul.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';


class DashboardMataKuliah extends StatefulWidget {
  DashboardMataKuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMataKuliahState createState() => _DashboardMataKuliahState();
}

class _DashboardMataKuliahState extends State<DashboardMataKuliah> {
  final _formKey = GlobalKey<FormState>();

  List<MataKuliah> lMatKul = new List();

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
            icon: Icon(Icons.person_add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMatKul(title: "Tambah Data Mata Kuliah")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMataKuliah(),
        builder: (BuildContext context, AsyncSnapshot<List<MataKuliah>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                  "Something Wrong with message: ${snapshot.error.toString()}"
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done){
            lMatKul = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  child: Container(
                    child: ListTile(
                      title: Text(lMatKul[position].sesi + " - " + lMatKul[position].kodeMataKuliah),
                      subtitle: Text(lMatKul[position].dosen),
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
                                        MaterialPageRoute(builder: (context) => UpdateMatKul(title: "Update Mata Kuliah",
                                            matkul:lMatKul[position], kodecari: lMatKul[position].kodeMataKuliah)),
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
                                        ApiServices().deleteMatKul(lMatKul[position].kodeMataKuliah);
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
              itemCount: lMatKul.length,
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