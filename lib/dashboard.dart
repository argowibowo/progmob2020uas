import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/dosen/dashboarddosen.dart';
import 'package:progmob_setelah_uts_72180190/jadwal/dashboardjadwal.dart';
import 'package:progmob_setelah_uts_72180190/loginpage.dart';
import 'package:progmob_setelah_uts_72180190/mahasiswa/dashboardmhs.dart';
import 'package:progmob_setelah_uts_72180190/matakuliah/dashboardmatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Felix Rivaldo"),
              accountEmail: Text("felix.rivaldo@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "FR",
                  style: TextStyle(fontSize: 40.00, color: Colors.cyan),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.assignment_ind),
              subtitle: Text("Menu CRUD Data Dosen"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DashboardDosen(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DashboardMahasiswa(title: "Dashboard Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DashboardMatakuliah(title: "Dashboard Matakuliah")),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.date_range_rounded),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DashboardJadwal(title: "Dashboard Jadwal")),
                );
              },
            ),
            Divider(
              color: Colors.cyan,
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
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Loginpage(title: "Login")),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dashboard", style: TextStyle(fontSize: 20, color: Colors.cyan),),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
