import 'package:flutter/material.dart';
import 'package:flutter_app/Mahasiswa/addmhs.dart';
import 'package:flutter_app/Mahasiswa/updatemhs.dart';
import 'package:flutter_app/Model.dart';
import 'package:flutter_app/Apiservices.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/TugasPertemuan8.dart';
import 'dart:async';

import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashMhs extends StatefulWidget {
  DashMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashMhsState createState() => _DashMhsState();
}

class _DashMhsState extends State<DashMhs> {

  List<Mahasiswa> lMhs = new List();

  FutureOr onGoBack(dynamic value){
    setState(() {
    });
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
                MaterialPageRoute(builder: (context) => AddMhs(title: "apajha")),
                ).then(onGoBack);
              },
          )
        ],
      ),
      /*drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Andreas Baikhati"),
              accountEmail: Text("andreas.widya@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "Ha",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            )
          ],
        ),
      ),*/
      body: FutureBuilder(
        future: ApiServices().getMahasiswa(),
          builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
                );
            } else if (snapshot.connectionState == ConnectionState.done) {
              lMhs = snapshot.data;
              return ListView.builder(
                  itemBuilder: (context, position) {
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
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UpdateMhs(title: "asa", mhs: lMhs[position], nimcari: lMhs[position].nim)),
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
            } else {
              return Center (
                child: CircularProgressIndicator(),
              );
            }
          },
          /*child: GestureDetector(
            child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Andreas Widya Mahendra"),
                      subtitle: Text("0812333445 - andreas.baikhati@staff.ukdw.ac.id"),
                        trailing: PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(
                                child: const Text('Delete'), value: 'Delete'),
                          ],
                        )
                    )
                  ],
                )
            ),
          )*/
      ),
    );
  }
}