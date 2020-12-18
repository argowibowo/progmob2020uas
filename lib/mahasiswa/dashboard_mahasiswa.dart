import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'package:flutter_72180200/mahasiswa/addmhs.dart';
import 'package:flutter_72180200/mahasiswa/updatemhs.dart';

class DashboardMahasiswa extends StatefulWidget{
  DashboardMahasiswa({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa>{
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> lMhs = new List(); //ketika panggil apiservice, ini utk menampung data yg digenerate flutter

  FutureOr onGoBack(dynamic value){ //ketika udah insert data, navigate ke halaman baru, klo goback akan refresh data barunya
    setState(() {}); //refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMhs(title: "Input Data Mahasiswa")),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiServices().getMahasiswas(),
        builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(
                "Something wrong with message : ${snapshot.error.toString()}",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }else if(snapshot.connectionState == ConnectionState.done){
            lMhs = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, position){
                return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                  shadowColor: Color(0xFF1565C0),
                  child: Container(
                    /*decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xFF81D4FA),
                          Color(0xFFB3E5FC),
                          Color(0xFFE1F5FE)
                        ],
                      ),
                    ),*/
                    margin: EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                    child: ListTile(
                      title: Text(
                        lMhs[position].nama + " - " + lMhs[position].nim,
                        style: TextStyle(
                          color: Color(0xFF0D47A1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        lMhs[position].email,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
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
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                        color: Color(0xFF0D47A1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                      //pindah ke menu update
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UpdateMhs(title: "Update Data Mahasiswa", mhs: lMhs[position], nimcari: lMhs[position].nim)),
                                      ).then(onGoBack);
                                    },
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 20,
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Color(0xFF0D47A1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: (){
                                      ApiServices().deleteMhs(lMhs[position].nim);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                  ),
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
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                backgroundColor: Colors.grey,
                strokeWidth: 7,
              ),
            );
          }
        }
      ),
    );
  }

}