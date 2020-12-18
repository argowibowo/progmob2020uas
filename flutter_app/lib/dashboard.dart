import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/dosen/dashboarddosen.dart';
import 'package:flutter_app/jadwal//dashboardjadwal.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/mahasiswa/dashboardmhs.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Pakai List karena bentuknya berupa list -> ke bawah
        child: ListView(
          children: <Widget>[
            Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                   image: AssetImage('assets/images/Image.png')
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                children: <Widget>[
                  Container(
                   height: 60,
                   child: Row (
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 33,
                        backgroundImage: NetworkImage('https://i.pinimg.com/originals/3a/73/c2/3a73c27f785eeaf79af5f036ed8f0de8.jpg'),
                      ),
                      SizedBox(width: 16,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Norah', style: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.white, fontSize: 18),),
                          Text('72170098', style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Montserrat Regular')),
                          Text('yohana.aprila@si.ukdw.ac.id', style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Montserrat Regular'))
                        ],
                      )
                    ]
                    ),
                  ),
                  GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: [

                            ],
                          ),
                        ),
                      ],
                      crossAxisCount: 2),
                ]
                ),
              ),
            ),

            ListTile(
              title: Text("Dosen"),
              subtitle: Text("Menu CRUD Data Dosen"),
              trailing: Icon(Icons.people),
              leading : Icon(Icons.account_circle),
              enabled : true,
              dense : false,
              isThreeLine: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Mahasiswa"),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              leading : Icon(Icons.account_circle),
              enabled : true,
              dense : false,
              isThreeLine: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen (title: "Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Matakuliah"),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              trailing: Icon(Icons.book_sharp),
              leading : Icon(Icons.account_circle),
              enabled : true,
              dense : false,
              isThreeLine: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul (title: "Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Jadwal"),
              subtitle: Text("Menu CRUD Data Jadwal"),
              trailing: Icon(Icons.event_note_outlined),
              leading : Icon(Icons.account_circle),
              enabled : true,
              dense : false,
              isThreeLine: true,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Jadwal"))
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
              leading : Icon(Icons.account_circle),
              enabled : true,
              dense : false,
              isThreeLine: true,
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
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