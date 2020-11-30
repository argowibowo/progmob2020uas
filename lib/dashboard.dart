import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Dosen/dashboarddsn.dart';
import 'package:flutter_app/Jadwal/dashboardjdwl.dart';
import 'package:flutter_app/Mahasiswa/dashboardmhs.dart';
import 'package:flutter_app/Matakuliah/dashboardmk.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              accountName: Text("Aldo Anggi Prayogi"),
              accountEmail: Text("aldo.anggi@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "AV",
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
                    MaterialPageRoute(builder: (context) => Dashboarddos(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.accessibility_new),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboardmhs(title: "Dashboard Mahasiswa")),
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
                  MaterialPageRoute(builder: (context) => Dashboardjdwl(title: "Dashboard Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Data MataKuliah"),
              trailing: Icon(Icons.account_balance_wallet),
              subtitle: Text("Menu CRUD Data MataKuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboardmk(title: "Dashboard MataKuliah")),
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
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push")),
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