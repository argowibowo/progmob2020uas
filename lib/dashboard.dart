import 'package:flutter/material.dart';
import 'package:flutter_app_progmob_72180181/main.dart';
import 'package:flutter_app_progmob_72180181/dosen/dashboarddosen.dart';
import 'package:flutter_app_progmob_72180181/jadwal/dashboardjadwal.dart';
import 'package:flutter_app_progmob_72180181/mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_app_progmob_72180181/matakuliah/dashboardmatakuliah.dart';
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
        title: Text("DashBoard 72180181"),
        backgroundColor: Colors.blue[500],
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0,),
                      Text("Mahasiswa", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outlined, size: 70.0,),
                      Text("Dosen", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dashboard Matakuliah",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_online_outlined, size: 70.0,),
                      Text("MataKuliah", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.schedule, size: 70.0,),
                      Text("Jadwal", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Jason Rivas"),
              accountEmail: Text("jason.rivas@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JR",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Profil"),
              trailing: Icon(Icons.people),
              subtitle: Text("Profil Mahasiswa"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Tentang"),
              trailing: Icon(Icons.info),
              subtitle: Text("Tentang Informasi"),
              onTap: (){},
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
              subtitle: Text("Keluar"),
              onTap: ()async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}