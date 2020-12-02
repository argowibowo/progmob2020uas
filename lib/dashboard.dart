import 'package:flutter/material.dart';
import 'package:flutter_2020/dosen/Dashboarddos.dart';
import 'package:flutter_2020/jadwal/dashboardjadwal.dart';
import 'package:flutter_2020/mahasiswa/dashboardmhs.dart';
import 'package:flutter_2020/matakuliah/dashboardmatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}
class Dasbrd extends StatefulWidget {
  Dasbrd({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DasbrdState createState() => _DasbrdState();
}

class _DasbrdState extends State<Dasbrd> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
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
             accountName: Text("Mikhael Effandito"),
             accountEmail: Text("effandito@88rising.ac.id"),
             currentAccountPicture : CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
              "ME",
              style :TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Data Dosen"),
            trailing: Icon(Icons.people),
            subtitle: Text("Menu CRUD Data Dosen"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder:(context) => Dashboarddos(title: "Dashboard Dosen",)),
              );
            },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => Dashboardmah(title:"Dashboard Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => DashboardMatkul(title:"Dashboard Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => Dashboardjad(title:"Dashboard Jadwal,")),
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
              trailing: Icon(Icons.exit_to_app_outlined),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is login", 1);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
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
      )
      ),
      ),
  )
  );
  }
}



