import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_72180200/dosen/dashboard_dosen.dart';
import 'package:flutter_72180200/jadwal/dashboard_jadwal.dart';
import 'package:flutter_72180200/login_view.dart';
import 'package:flutter_72180200/mahasiswa/dashboard_mahasiswa.dart';
import 'package:flutter_72180200/matakuliah/dashboard_matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color(0xFF0D47A1),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nadia Angelica Nugroho"),
              accountEmail: Text("nadia.angelica@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFE8EAF6),
                child: Text(
                  "NA",
                  style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 40
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
                //pindah ke dashboard dosen
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Menu Dosen",)),
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
                Icons.person_outline,
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
                //pindah ke dashboard mahasiswa
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
                Icons.library_books_rounded,
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
                //pindah ke dashboard matakuliah
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Menu Matakuliah",)),
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
                //pindah ke dashboard jadwal
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Menu Jadwal",)),
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
                //logout dgn sharedpreferences
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login_progmob", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,15),
                  child: Image.asset(
                    "images/logo_progmob.png",
                    width: 300,
                    height: 300,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,5),
                  child: Text(
                    'Welcome to Progmob 2020!',
                    style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 20
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10)
                ),
                RaisedButton(
                  color: Color(0xFF0D47A1),
                  disabledColor: Color(0xFF0D47A1),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login_progmob", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                    );
                  },
                )
              ]
          ),
        ),
      ),
    );
  }
}