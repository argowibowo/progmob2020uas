import 'package:flutter/material.dart';
import 'package:progmob_flutter/dosen/dashboardDosen.dart';
import 'package:progmob_flutter/jadwal/dashboardJadwal.dart';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMhs.dart';
import 'package:progmob_flutter/matakuliah/dashboardMatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text("Dashboard"),
      ),
      drawer:Drawer(
        child: ListView(
            children:<Widget>[

              UserAccountsDrawerHeader(
                  accountName: Text("Julio Philippus"),
                  accountEmail: Text("julio.gerald@si.ukdw.ac.id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "JP",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  )
              ),

              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outlined),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMhs(title:"Dashboard Mahasiswa")));
                },
              ),

              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardDsn(title:"Dashboard Dosen")));
                },
              ),

              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.book),
                subtitle: Text("Menu CRUD Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMatkul(title:"Dashboard Matakuliah")));
                },
              ),

              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.date_range),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardJadwal(title:"Dashboard Jadwal")));
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
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(title: "Halaman Login",)));
                },
              ),
            ]
        ),
      ),
    );
  }
}