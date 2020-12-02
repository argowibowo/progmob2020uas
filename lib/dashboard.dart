import 'package:flutter/material.dart';
import 'package:flutter_app/CRUD/dosen/datadosen.dart';
import 'package:flutter_app/CRUD/jadwal/datajadwal.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/CRUD/mahasiswa/datamahasiswa.dart';
import 'package:flutter_app/CRUD/matakuliah/datamatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Brigita Monic"),
              accountEmail: Text("brigita.trisna@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "BM",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              subtitle: Text("Menu CRUD Data Dosen"),
              trailing: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataDosen(title: "Data Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataMahasiswa(title: "Data Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              trailing: Icon(Icons.book_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoardDataMatakuliah(title: "Data Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              subtitle: Text("Menu CRUD Data Jadwal"),
              trailing: Icon(Icons.event_note_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoardDataJadwal(title: "Dashboard Jadwal"))
                );
              },
            ),
            Divider(
              color: Colors.black,
              height: 10,
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
                  MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
