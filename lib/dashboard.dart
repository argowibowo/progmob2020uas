import 'package:flutter/material.dart';
import 'package:flutter_app_1/dosen/dbdosen.dart';
import 'package:flutter_app_1/jadwal/dbjadwal.dart';
import 'package:flutter_app_1/login.dart';
import 'package:flutter_app_1/mahasiswa/dbmahsiswa.dart';
import 'package:flutter_app_1/matkul/dbmatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mahasiswa/DashboardMhs.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
            children: <Widget>[

              UserAccountsDrawerHeader(
                  accountName: Text("Dycha Rizky"),
                  accountEmail: Text("dycha.rizky@si.ukdw.ac.id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "DDD",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              ),

              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.nature_people),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          DashboardMhs(title: "Mahasiswa")));
                },
              ),

              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.person_pin_sharp),
                subtitle: Text("Dosen"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => dbdosen(title: "Dosen")));
                },
              ),

              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.library_books_sharp),
                subtitle: Text("Matakuliah"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          DashboardMhs(title: " Matakuliah")));
                },
              ),

              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.date_range),
                subtitle: Text("Jadwal"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => dbjadwal(title: "Jadwal")));
                },
              ),

              Divider(
                color: Colors.yellowAccent,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),

              ListTile(
                title: Text("LOGOUT"),
                trailing: Icon(Icons.logout),
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences
                      .getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => login(title: "Login",)));
                },
              ),
            ]
        ),
      ),
    );
  }
}