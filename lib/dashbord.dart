import 'package:flutter/material.dart';
import 'package:flutter_progmob/Dosen/dbdosen.dart';
import 'package:flutter_progmob/Jadwal/dbjadwal.dart';
import 'package:flutter_progmob/Pref.dart';
import 'package:flutter_progmob/main.dart';
import 'package:flutter_progmob/Mahasiswa/dbmahasiswa.dart';
import 'package:flutter_progmob/Matakuliah/dbmatkul.dart';
import 'package:flutter_progmob/tugaspertemuan8.dart';
import 'dart:async';

import 'package:flutter_progmob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {  //<~~~
  dashboard({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _dashboardState createState() => _dashboardState();  //<~~~~
}

class _dashboardState extends State<dashboard> {    //<~~


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Deden Prasetio"), //<~~~~~
              accountEmail: Text("deden.prasetio@si.ukdw.ac.id"), //<~~~~
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "DP", //<~ ~~~~~
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),    //<~~~~
              trailing: Icon(Icons.people),   //<~~~
              subtitle: Text("Menu CRUD Data Dosen"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dsn(title: "DASHBOARD DOSEN")),  //<~~~
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),   //<~~~
              trailing: Icon(Icons.people),   //<~~
              subtitle: Text("Menu CRUD Data Mahasiswa"),   //<~~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mhs(title: "DASHBOARD MAHASISWA")),  //<~~~
                );
              },
            ),
            ListTile(
              title: Text("Data Mata Kuliah"),  //<~~~
              trailing: Icon(Icons.book),  //<~~~
              subtitle: Text("Menu CRUD Data Mata Kuliah"),  //<~~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Matkul(title: "DASHBOARD MATAKULIAH")),  //<~~
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),    //<~~~
              trailing: Icon(Icons.schedule),  //<~~~~
              subtitle: Text("Menu CRUD Data Jadwal"),   //<~~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Jadwal(title: "DASHBOARD JADWAL")),  //<~~
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
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => preferences(title: "WELCOME !",)),   //<~~
                );
              },
            )
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("DASHBOARD",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}