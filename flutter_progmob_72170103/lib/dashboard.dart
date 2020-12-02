import 'package:flutter/material.dart';
import 'file:///C:/Users/CHLARA/Android/flutter_progmob_72170103/lib/dosen/dashboarddosen.dart';
import 'file:///C:/Users/CHLARA/Android/flutter_progmob_72170103/lib/jadwal/dashboardjadwal.dart';
import 'file:///C:/Users/CHLARA/Android/flutter_progmob_72170103/lib/matakuliah/dashbordmatkul.dart';
import 'file:///C:/Users/CHLARA/Android/flutter_progmob_72170103/lib/mahasiswa/dashbordmhs.dart';
import 'package:flutterprogmob72170103/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Brillianty Chlara Ambrelly"),
              accountEmail: Text("brillianty.chlara@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "BCA",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              subtitle: Text("Menu CRUD Data Dosen"),
              trailing: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              trailing: Icon(Icons.book_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              subtitle: Text("Menu CRUD Data Jadwal"),
              trailing: Icon(Icons.event_note_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal"))
                );
              },
            ),
            Divider(
              color: Colors.black,
              height: 10,
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
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Halaman Login",)),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}