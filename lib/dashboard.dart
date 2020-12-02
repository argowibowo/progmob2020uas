import 'package:flutter/material.dart';
import 'package:flutter_progmob/LoginPage.dart';
import 'package:flutter_progmob/bottomnav.dart';
import 'package:flutter_progmob/dosen/DashboardDosen.dart';
import 'package:flutter_progmob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_progmob/TugasPertemuan1.dart';

import 'jadwal/DashboardJdw.dart';
import 'mahasiswa/DashBoardMhs.dart';
import 'matakuliah/DashboardMtk.dart';



class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                accountName: Text("Adrian Stefano"),
                accountEmail: Text("adrianstefano@mail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AS",
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
                  MaterialPageRoute(builder: (context) => DashboardDs(title: "Data Dosen",))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Data Mahasiswa",))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMtk(title: "Data Matakuliah",))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.calendar_today_outlined),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJdw(title: "Data Jadwal",))
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
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_logged", 0);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: "wow",))
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
            ),
          ),
        ),
      ),
    );
  }
}