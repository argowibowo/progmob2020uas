import 'package:flutter/material.dart';
import 'package:project_flutter_2020/dosen/dasboarddosen.dart';
import 'package:project_flutter_2020/jadwal/dasboardjadwal.dart';
import 'package:project_flutter_2020/mahasiswa/dasboardmhs.dart';
import 'package:project_flutter_2020/main.dart';
import 'package:project_flutter_2020/matakuliah/dasboardmatkul.dart';
import 'package:project_flutter_2020/windows/profile.dart';
import 'package:project_flutter_2020/windows/save.dart';
import 'package:project_flutter_2020/windows/start.dart';
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
        title: Text("DashBoard 72180208"),
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
                    MaterialPageRoute(builder: (context) => Dashboardmhs(title: "Dashboard Mahasiswa",)),
                  );
                },
                splashColor: Colors.pinkAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0,),
                      Text(" Data Mahasiswa", style : new TextStyle(fontSize: 17.0))
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
                    MaterialPageRoute(builder: (context) => Dashboarddosen(title: "Dashboard Dosen",)),
                  );
                },
                splashColor: Colors.pinkAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outlined, size: 70.0,),
                      Text(" Data Dosen", style : new TextStyle(fontSize: 17.0))
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
                    MaterialPageRoute(builder: (context) => Dashboardmatkul(title: "Dashboard Matakuliah",)),
                  );
                },
                splashColor: Colors.pinkAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_online_outlined, size: 70.0,),
                      Text(" Data MataKuliah", style : new TextStyle(fontSize: 17.0))
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
                    MaterialPageRoute(builder: (context) => Dashboardjadwal(title: "Dashboard Jadwal",)),
                  );
                },
                splashColor: Colors.pinkAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.schedule, size: 70.0,),
                      Text(" Data Jadwal", style : new TextStyle(fontSize: 17.0))
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
              accountName: Text("Modesta Oki"),
              accountEmail: Text("Modesta.oki@si.ukdw.ac.id"),
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
              title: Text("About"),
              trailing: Icon(Icons.info),
              subtitle: Text("More Information"),
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
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo Push",)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
