import 'package:flutter/material.dart';
import 'package:flutter_progmob/dosen/dashboarddosen.dart';
import 'package:flutter_progmob/jadwal/dashboardjadwal.dart';
import 'package:flutter_progmob/mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_progmob/main.dart';
import 'package:flutter_progmob/matakuliah/dashboardmatkul.dart';
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
      ),
        drawer: Drawer(
        child: ListView(
          children: <Widget> [
            UserAccountsDrawerHeader(
              accountName: Text("Diory Panjaitan"),
              accountEmail: Text("diory.rotua@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "DP",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people_alt),
              subtitle: Text("Menu CRUD Data Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books_outlined),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah",)),
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
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal",)),
                );
              },
            ),
            Divider(
              color: Colors.black45,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Welcome",)),
                );
              },

            )
          ],
        ),
      ),
      body: Container(
        child:Center(
          child: Text("Dashboard",
            style: TextStyle(
              fontSize: 20
            )
          )
        )
      )
    );
  }
}