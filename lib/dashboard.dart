import 'package:andre_fapp/login.dart';
import 'package:flutter/material.dart';
import 'package:andre_fapp/Dosen/dashboarddsn.dart';
import 'package:andre_fapp/Jadwal/dashboardjadwal.dart';
import 'package:andre_fapp/Mahasiswa/dashboardmhs.dart';
import 'package:andre_fapp/MataKuliah/dashboardmatkul.dart';
import 'dart:async';

import 'package:andre_fapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

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
              accountName: Text("Bao Unyu"),
              accountEmail: Text("andreas.susilo@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "BAO", //<~ ~~~~~
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Dosen"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dsn(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mhs(title: "Dashboard Mahasiswa")),
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
                  MaterialPageRoute(builder: (context) => Mat(title: "Dashboard Mata Kuliah")),  //<~~
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
                  MaterialPageRoute(builder: (context) => Jad(title: "Dashboard Jadwal")),  //<~~
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
                  MaterialPageRoute(builder: (context) => Login(title: "Halo")),   //<~~
                );
              },
            )
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("Dashboard",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}