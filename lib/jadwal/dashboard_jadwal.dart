import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/jadwal/addjadwal.dart';
import 'package:flutter_72180200/jadwal/updatejadwal.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'package:flutter_72180200/mahasiswa/addmhs.dart';
import 'package:flutter_72180200/mahasiswa/updatemhs.dart';

class DashboardJadwal extends StatefulWidget{
  DashboardJadwal({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal>{
  final _formKey = GlobalKey<FormState>();

  List<Jadwal> lJadwal = new List(); //ketika panggil apiservice, ini utk menampung data yg digenerate flutter
  //List<Matkul> lMatkul = new List();
  //List<Dosen> lDosen = new List();

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
                MaterialPageRoute(builder: (context) => AddJadwal(title: "Input Data Jadwal")),
              ).then(onGoBack);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: ApiServices().getJadwals(),
          builder: (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot){
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
              lJadwal = snapshot.data;
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
                          lJadwal[position].matkul + " - " + lJadwal[position].dosen,
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Hari " + lJadwal[position].hari + " - Sesi " + lJadwal[position].sesi
                              + " - SKS " + lJadwal[position].sks,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFF0D47A1),
                          child: Icon(
                            Icons.schedule_outlined,
                            color: Colors.white,
                          ),
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
                                        //print("dosen " + lJadwal[position].id_dosen + " - matkul " + lJadwal[position].id_matkul);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UpdateJadwal(title: "Update Data Jadwal", jadwal: lJadwal[position], id_cari: lJadwal[position].id /*, id_dosen: lDosen[position].id, id_matkul: lMatkul[position].id*/,)),
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
                                        ApiServices().deleteJadwal(lJadwal[position].id);
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
                itemCount: lJadwal.length,
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