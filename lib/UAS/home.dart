import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180247/UAS/login.dart';
import 'package:flutter_72180247/mahasiswa/mahasiswa.dart';
import 'package:flutter_72180247/dosen/dosen.dart';
import 'package:flutter_72180247/jadwal/jadwal.dart';
import 'package:flutter_72180247/matakuliah/matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}):super(key:key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Christyanson"),
              accountEmail: Text("christyason@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Image.asset(
                  "images/logo_ayam.jpg",
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Data Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.person_outline),
              subtitle: Text("Menu CRUD Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardMahasiswa(title: "Data Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.featured_play_list_rounded),
              subtitle: Text("Menu CRUD Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardJadwal(title: "Data Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Data MataKuliah"),
              trailing: Icon(Icons.list_alt),
              subtitle: Text("Menu CRUD MataKuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardMatakuliah(title: "Data MataKuliah")),
                );
              },
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
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginUas()),
                );
              },
            )
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("PROGMOB!?!?"),
      ),

      body: Stack(
        children: <Widget>[

          Expanded(child:
            GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10 ,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage('images/mahasiswa.png')
                              ),
                          ),
                      ),
                      FlatButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => dashboardMahasiswa(title: "Data Mahasiswa")),
                          );
                      },
                          child: Text("Data Mahasiswa")),
                    ],
                )
              ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70)
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage('images/dosen.png')
                            ),
                          ),
                        ),
                        FlatButton(onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Data Dosen")),
                            );
                        },
                            child: Text("Data Dosen")),
                      ],
                    )
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70)
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage('images/matakuliah.png')
                            ),
                          ),
                        ),
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dashboardMatakuliah(title: "Data Matakuliah")),
                          );
                        },
                            child: Text("Data Matakuliah")),
                      ],
                    )
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70)
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage('images/jadwal.png')
                            ),
                          ),
                        ),
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dashboardJadwal(title: "Data Jadwal")),
                          );
                        },
                            child: Text("Data Jadwal")),
                      ],
                    )
                ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}