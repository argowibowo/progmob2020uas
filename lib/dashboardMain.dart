import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dosen/dashboardDosen.dart';
import 'jadwal/dashboardJadwal.dart';
import 'login.dart';
import 'mahasiswa/dashboardMahasiswa.dart';
import 'matakuliah/dashboardMatakuliah.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Rico Alex Sandra"),
                accountEmail: Text("rico.alex@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("RAS",style: TextStyle(fontSize: 30.0)),
                ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.person),
              subtitle: Text("Menu Data Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dasboard Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu Data Mahasiwa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dasboard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.calendar_today_outlined),
              subtitle: Text("Menu Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dasboard Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.access_time_sharp),
              subtitle: Text("Menu Data Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dasboard Jadwal"))
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
                  context, MaterialPageRoute(builder: (context) => login(title: "Login"))
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dasboard Utama"),
        ),
      ),
    );
  }
}