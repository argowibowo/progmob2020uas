import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/tugaspertemuan9.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dosen/dashboarddosen.dart';
import 'main.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 11"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Dito Adriel "),
              accountEmail: Text("ditoadriel@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.blue
                    : Colors.white,
                child: Text(
                  "DA",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              subtitle: Text("CRUD Data Dosen"),
              trailing: Icon(Icons.person),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dosen()),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              subtitle: Text("CRUD Data Mahasiswa"),
              trailing: Icon(Icons.people),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("LogOut"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt('is_login', 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "tugas 9",)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}