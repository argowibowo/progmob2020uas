import 'package:flutter/material.dart';
import 'package:hello_world_flutter/dosen/dashboarddosen.dart';
import 'package:hello_world_flutter/jadwal/dashboardjadwal.dart';
import 'package:hello_world_flutter/mahasiswa/dashboardmhs.dart';
import 'package:hello_world_flutter/matakuliah/dashboardmatkul.dart';
import 'package:hello_world_flutter/dashboardbaru.dart';
import 'package:hello_world_flutter/preferences.dart';
import 'package:hello_world_flutter/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Johny s Family",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          dashboard()
        ],
      ),
      drawer:Drawer(
        child: ListView(
            children:<Widget>[

              UserAccountsDrawerHeader(
                  accountName: Text("Vinanda Kristianti"),
                  accountEmail: Text("vinandakristianti@si.ukdw.ac.id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "VK",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              ),

              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outlined),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardMhs(title:"Dashboard Mahasiswa")));
                },
              ),

              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardDosen(title:"Dashboard Dosen")));
                },
              ),

              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.book),
                subtitle: Text("Menu CRUD Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardmatkul(title:"Dashboard Matakuliah")));
                },
              ),

              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.date_range),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboardjadwal(title:"Dashboard Jadwal")));
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
                trailing: Icon(Icons.logout),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => preferences(title: "Login",)));
                },
              ),
            ]
        ),
      ),
    );
  }
}