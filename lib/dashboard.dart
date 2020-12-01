import 'package:flutter/material.dart';
import 'package:hello_world_flutter/dosen/dashboarddosen.dart';
import 'package:hello_world_flutter/jadwal/dashboardjadwal.dart';
import 'package:hello_world_flutter/mahasiswa/dashboardmhs.dart';
import 'package:hello_world_flutter/matakuliah/dashboardmatkul.dart';
import 'package:hello_world_flutter/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

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
                  accountName: Text("Vinanda Kristianti"),
                  accountEmail: Text("vinanda.kristianti@si.ukdw.ac.id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "VK",
                      style: TextStyle(fontSize: 20.0),
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
                      MaterialPageRoute(builder: (context) => dashboardmhs(title:"Dashboard Mahasiswa")));
                },
              ),

              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboarddosen(title:"Dashboard Dosen")));
                },
              ),

              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.book),
                subtitle: Text("Menu CRUD Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardmatkul(title:"Dashboard Matakuliah")));
                },
              ),

              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.date_range),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardjadwal(title:"Dashboard Jadwal")));
                },
              ),

              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),

              ListTile(
                title: Text("LOGOUT"),
                trailing: Icon(Icons.logout),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => preferences(title: "Login",)));
                },
              ),
            ]
        ),
      ),
    );
  }
}