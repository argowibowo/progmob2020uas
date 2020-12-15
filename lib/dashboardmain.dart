import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/dosen/dashboard_dosen.dart';
import 'package:flutter_app/jadwal/dashboard_jadwal.dart';
import 'package:flutter_app/mahasiswa/dashboard_mahasiswa.dart';
//import 'package:flutter_app/Matakuliah/dashboard_matakuliah.dart';


class Dashboardmain extends StatefulWidget {
  Dashboardmain({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _DashboardmainState createState() => _DashboardmainState();
}

class _DashboardmainState extends State<Dashboardmain> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Informasi Akademik"),

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nathanael Dennis S "),
              accountEmail: Text("nathanael.dennis@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: Text(
                  "NDS",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Data Dosen",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.people,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Dosen",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Menu Dosen",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Mahasiswa",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.people_alt_outlined,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Mahasiswa",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Menu Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Matakuliah",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.library_books,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Matakuliah",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Menu Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Jadwal",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.schedule,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Jadwal",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Menu Jadwal",)),
                );
              },
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Color(0xFF0D47A1),
              ),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login Sistem Akademik",)),
                );
              },
            ),
          ],

        ),
      ),
      body: Container(
          child: Center(
            child: Text("Nael",
              style: TextStyle(
                fontSize: 20,

              ),


            ),
          ),
      ),
    );
  }
}