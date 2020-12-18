import 'package:flutter/material.dart';
import 'package:progmob_flutter/dosen/dashboardDosen.dart';
import 'package:progmob_flutter/jadwal/dashboardJadwal.dart';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMhs.dart';
import 'package:progmob_flutter/matakuliah/dashboardMatkul.dart';
import 'package:progmob_flutter/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmob_flutter/logout.dart';

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
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.date_range),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardJadwal(title:"Dashboard Jadwal")));
                },
              ),

            ]
        ),
      ),
    );
  }
}