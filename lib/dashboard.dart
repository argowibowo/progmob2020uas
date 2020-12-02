import 'package:flutter/material.dart';
import 'package:flutter_72180264progmob/dosen.dart';
import 'package:flutter_72180264progmob/jadwal.dart';
import 'package:flutter_72180264progmob/login.dart';
import 'package:flutter_72180264progmob/mahasiswa.dart';
import 'package:flutter_72180264progmob/main.dart';
import 'package:flutter_72180264progmob/matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Dashboard"),
      ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
              UserAccountsDrawerHeader(
              accountName: Text("Ester Glorya Siwu"),
              accountEmail: Text("ester.glorya@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("EGS", style: TextStyle(fontSize: 30.0)),
              ),
              ),
                ListTile(
                  title: Text("Data Dosen"),
                  trailing: Icon(Icons.person),
                  subtitle: Text("Menu Data Dosen"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen"))
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa"))
                  );
                },
              ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.calendar_today_outlined),
              subtitle: Text("Menu Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dashboard Matakuliah"))
               );
              },
            ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.access_time_sharp),
                subtitle: Text("Menu Data Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dasboard Jadwal"))
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
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Push"))
                    );
                  },
                ),
              ],
            ),
          ),
      body: Container(
        child: Center(
          child: Text("Dasboard Utama"),
        ),
      ),
    );
  }
}
