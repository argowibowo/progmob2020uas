import 'package:flutter/material.dart';
import 'package:flutter_app/dosen/dashboarddosen.dart';
import 'package:flutter_app/jadwal/dashboardjadwal.dart';
import 'package:flutter_app/mahasiswa/dashboardmhs.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/matakuliah/dashboardmatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  //int _counter = 2;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
              accountName: Text("Adrian Yunas"),
              accountEmail: Text("adrian.yunas@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "AY",
                  style: TextStyle(fontSize: 40.0),
          )
          )
      ),
        ListTile(
          title: Text("Data Dosen"),
          trailing: Icon(Icons.people),
          subtitle: Text("Menu CRUD DATA Dosen"),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")),
            );
          },
        ),
          ListTile(
            title: Text("Data Mahasiswa"),
            trailing: Icon(Icons.people_outline),
            subtitle: Text("Menu CRUD DATA Mahasiswa"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
              );
            },
          ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.library_books),
                subtitle: Text("Menu CRUD DATA Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu CRUD DATA Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")),
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Hola Push",)),
            );
          },
        ),
        ],
          ),
        ),
      body: Container(
        child: Center(
          child: Text("Dashboard", style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}