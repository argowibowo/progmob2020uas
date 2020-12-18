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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard UAS"),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Selamat Datang, Silahkan pilih",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa",)),
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
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah",)),
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
              accountName: Text("Adrian Yunas"),
              accountEmail: Text("adrian.yunas@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "AY",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Akun"),
              trailing: Icon(Icons.account_box_outlined),
              onTap: (){},
            ),
            ListTile(
              title: Text("Informasi"),
              trailing: Icon(Icons.info_outline),
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
              onTap: ()async{
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
    );
  }
}