import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_72160025/Dosen/dosen.dart';
import 'package:flutter_72160025/Jadwal/jadwal.dart';
import 'package:flutter_72160025/Matakuliah/matakuliah.dart';
import 'package:flutter_72160025/Mahasiswa/mahasiswa.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_72160025/main.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Brian Eldrin Sombuk"),
              accountEmail: Text("BrianEldrin@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "BS",
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
                  MaterialPageRoute(builder: (context) => dosen(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.school),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mahasiswa(title: "Dashboard Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.access_alarm),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => jadwal(title: "Dashboard Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Data MataKuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Data MataKuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => matakuliah(title: "Dashboard MataKuliah")),
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
              trailing: Icon(Icons.arrow_back),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo Push")),
                );
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
              style: TextStyle(
                  fontSize: 20
              )),
        ),
      ),
    );
  }
}