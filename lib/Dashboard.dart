import 'package:flutter/material.dart';
import 'package:flutter_app/Dosen/dashboarddsn.dart';
import 'package:flutter_app/Jadwal/dashboardjdwl.dart';
import 'package:flutter_app/Matakuliah/dashboardmkh.dart';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter_app/NavigationBar/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mahasiswa/dashboardmhs.dart';
import 'Login.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() =>_DashboardState();

}

class _DashboardState extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Yose Awanaustus Salawangi"),
              accountEmail: Text("yose.awanaustus@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "YS",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardDsn(title:"Dashboard Dosen",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.person),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMhs(title:"Dashboard Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.assignment_outlined),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMkh(title:"Dashboard Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardJdwl(title:"Dashboard Jadwal",)),
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
              trailing: Icon(Icons.logout),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        )
      )
    );
  }
}
