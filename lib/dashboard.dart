import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/jadwal/dashboardjadwal.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:flutter_progmob_2020/matkul/dashboardmatkul.dart';
import 'package:flutter_progmob_2020/pertemuan1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dosen/dashboarddosen.dart';
import 'mahasiswa/dashboardmahasiswa.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formkey = GlobalKey<FormState>();

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
                  accountName: Text("Jeffry Caesario"),
                  accountEmail: Text("jeffry.caesario@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JC",
                    style: TextStyle(fontSize: 40.0),
                ),
              ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                leading: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoardDosen(title: "Dashboard Dosen")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                leading: Icon(Icons.people_outline),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                leading: Icon(Icons.book_outlined),
                subtitle: Text("Menu CRUD Data Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah")),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                leading: Icon(Icons.timer_outlined),
                subtitle: Text("Menu CRUD Data Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
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
                title: Text("LOGOUT"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
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
          ),
        ),
      )
      )
    );
  }
}