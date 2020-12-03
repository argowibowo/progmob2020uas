import 'package:flutter/material.dart';
import 'package:simpelproject/dosen.dart';
import 'package:simpelproject/jadwal.dart';
import 'package:simpelproject/mahasiswa.dart';
import 'package:simpelproject/matkul.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}
class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DasboardState createState() => _DasboardState();
}

class _DasboardState extends State<Dashboard> {
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
             accountName: Text("I Putu Sugosa A"),
             accountEmail: Text("putu.sugosa@ukdw.ac.id"),
             currentAccountPicture : CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
              "ME",
              style :TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Data Dosen"),
            trailing: Icon(Icons.people),
            subtitle: Text("CRUD Data Dosen"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder:(context) => Dashboarddosen(title: "Dosen",)),
              );
            },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              subtitle: Text("CRUD Data Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => Dashboardmhs(title:"Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("CRUD Data Matakuliah"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => DashboardMatkul(title:"Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => Dashboardjadwal(title:"Jadwal,")),
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