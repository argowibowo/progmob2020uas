import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_72180247/dosen/dosen.dart';
import 'package:flutter_72180247/jadwal/jadwal.dart';
import 'package:flutter_72180247/pertemuan 2/login.dart';
import 'package:flutter_72180247/mahasiswa/mahasiswa.dart';
import 'package:flutter_72180247/matakuliah/matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}):super(key:key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Christyanson"),
              accountEmail: Text("christyason@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  "images/logo_splash.png",
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardDosen(title: "Data Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.person_outline),
              subtitle: Text("Menu CRUD Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardMahasiswa(title: "Data Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.featured_play_list_rounded),
              subtitle: Text("Menu CRUD Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardJadwal(title: "Data Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Data MataKuliah"),
              trailing: Icon(Icons.list_alt),
              subtitle: Text("Menu CRUD MataKuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardMatakuliah(title: "Data MataKuliah")),
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
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            )
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("PROGMOB!?!?"),
      ),
    );
  }
}