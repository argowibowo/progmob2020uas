import 'package:flutter/material.dart';
import 'package:flutter_app/Dosen/dashboarddsn.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/Jadwal/dashboardjadwal.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/Mahasiswa/dashboardmhs.dart';
import 'package:flutter_app/MataKuliah/dashboardmatkul.dart';
import 'package:flutter_app/TugasPertemuan8.dart';
import 'dart:async';

import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBo extends StatefulWidget {
  DashBo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashBoState createState() => _DashBoState();
}

class _DashBoState extends State<DashBo> {

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
                  accountName: Text("Andreas Baikhati"),
                  accountEmail: Text("andreas.widya@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AB",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu Data Dosen"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashDo(title: "Dosen")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu Data Mahasiswa"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashMhs(title: "Mahasiswa")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mata Kuliah"),
                trailing: Icon(Icons.book),
                subtitle: Text("Menu Data Mata Kuliah"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashMk(title: "Mata Kuliah")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu Data Jadwal"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashJd(title: "Jadwal")),
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
                      MaterialPageRoute(builder: (context) => Login(title: "Login")),
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
