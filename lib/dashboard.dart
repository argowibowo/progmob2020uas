import 'dart:async';

import 'package:baru1/main.dart';
import 'package:baru1/tugaspertemuan8.dart';
import 'package:flutter/material.dart';
import 'package:baru1/Dosen/dashboard_dosen.dart';
import 'package:baru1/Jadwal/dashboard_jadwal.dart';
import 'package:baru1/Login.dart';
import 'package:baru1/Mahasiswa/dashboard_mahasiswa.dart';
import 'package:baru1/Matakuliah/dashboard_matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baru1/model.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key,title}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();

  static Future<List<Dashboard>> fromJson(body) {}
}

class _DashboardState extends State<Dashboard> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds:5);
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = pref.getInt("is_login");
    if (login == 0){
      return Timer (duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Hallo Push',)));
      });
    }else{
      return Timer (duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => tugasPertemuan8 (title: 'tugas pertemuan 8',)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        drawer : Drawer( //DRAWER-->hanya titik 3 yang muncul
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Kristovera M.P"),
                accountEmail: Text("kristovera.maleliana@si.udkw.ac.id") ,
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child:  Text(
                    "KP",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardDosen (title: 'Dashboard Dosen',))
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outline),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMahasiswa (title: 'Dashboard Mahasiswa',))
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.library_books),
                subtitle: Text("Menu CRUD Data Matakuliah"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: 'Dashboard Matakuliah ',))
                  );
                },
              ),
              ListTile(
                title: Text("Data jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu CRUD Data jadwal"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardJadwal (title: 'Dashboard Jadwal',))
                  );
                },
              ),
              Divider(
                color: Colors.blue,
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
                      MaterialPageRoute(builder: (context) => MyHomePage (title: 'Hallo Push',))
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
                    fontSize : 20
                )
            ),
          ),
        )
    );
  }
}