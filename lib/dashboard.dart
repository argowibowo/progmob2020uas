import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/dosen/dashboarddsn.dart';
import 'package:flutter_progmob_2020/jadwal/dashboardjadwal.dart';
import 'package:flutter_progmob_2020/mahasiswa/dashboardmhs.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:flutter_progmob_2020/matakuliah/dashboardmatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {  //<~~~
  Dashboard({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _DashboardState createState() => _DashboardState();  //<~~~~
}

class _DashboardState extends State<Dashboard> {    //<~~

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
              accountName: Text("Jessy Friska Sitinjak"), //<~~~~~
              accountEmail: Text("jessy.friska@si.ukdw.ac.id"), //<~~~~
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "@@", //<~ ~~~~~
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
                  MaterialPageRoute(builder: (context) => dashDos(title: "Dashboard Dosen")),  //<~~~
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
                  MaterialPageRoute(builder: (context) => dashMhs(title: "Dashboard Mahasiswa")),  //<~~~
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
                  MaterialPageRoute(builder: (context) => dashMK(title: "Dashboard Mata Kuliah")),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashJadwal(title: "Dashboard Jadwal")),
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
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Jessy Friska")),
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