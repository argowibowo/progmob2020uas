
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/dashboarddosen.dart';
import 'package:flutter_app_1/dashboardjadwal.dart';
import 'package:flutter_app_1/dashboardmatkul.dart';
import 'package:flutter_app_1/dashboardmhs.dart';
import 'package:flutter_app_1/halamanlogin.dart';
import 'package:flutter_app_1/main.dart';
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
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Nabiya Eltarani"),
                accountEmail: Text("nabiya.eltarani@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    "NE",
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
                  MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")),
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
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
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
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")),
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
                  MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah")),
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
                    MaterialPageRoute(builder: (context) => HalamanLogin(title: "Halo ",)),
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


