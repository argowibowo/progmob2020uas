import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DashboardDosen/dashboarddosen.dart';
import 'package:flutter_app/DashboardJadwal/dashboardjadwal.dart';
import 'package:flutter_app/DashboardMatkul/dashboardmatakuliah.dart';
import 'package:flutter_app/DashboardMhs/dashboardmahasiswa.dart';
import 'package:flutter_app/Tugas9/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
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
              accountName: Text("Elza Miyori"),
              accountEmail: Text("elza.miyori@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  "EM",
                  style: TextStyle(fontSize: 40.0),
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
                  MaterialPageRoute(builder: (context) => dashboardosen(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardmahasiswa(title: "Dashboard Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Jadwal"),
              trailing: Icon(Icons.schedule_outlined),
              subtitle: Text("Menu CRUD Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardjadwal(title: "Dashboard Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardmatkul(title: "Dashboard Matakuliah")),
                );
              },
            ),
            Divider(
              color: Colors.black87,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Halo Push",)),
                );
              },
            ),
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
        ),
      ),
    );
  }
}