import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/Dosen/dashboardDosen.dart';
import 'package:flutter_progmob2020/Jadwal/dashboardJadwal.dart';
import 'package:flutter_progmob2020/Mahasiswa/dashboardMhs.dart';
import 'package:flutter_progmob2020/Matakuliah/dashboardMk.dart';
import 'package:flutter_progmob2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

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
              accountName: Text("Maytha Walvinata Sitio"),
              accountEmail: Text("maytha.walvinata@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "MW",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dashboard Dosen"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Dosen"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardDsn(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Dasboard Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Data Dashboard Mata Kuliah"),
              trailing: Icon(Icons.book),
              subtitle: Text("Menu CRUD Data Mata Kuliah"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMk(title: "Dashboard Mata Kuliah")),
                );
              },
            ),
            ListTile(
              title: Text("Data Dashboard Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")),
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
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "72180238")),
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
