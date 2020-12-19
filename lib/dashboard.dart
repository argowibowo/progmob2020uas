import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/dosen/dashboarddosen.dart';
import 'package:flutter_progmob2020/Jadwal/dashboardjadwal.dart';
import 'package:flutter_progmob2020/Mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_progmob2020/Matakuliah/dashboardmatkul.dart';
import 'package:flutter_progmob2020/home.dart';
import 'package:flutter_progmob2020/login.dart';
import 'package:flutter_progmob2020/griddashboard.dart';
import 'package:flutter_progmob2020/shared_preferences.dart';

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
                      "Kevin s Fam",
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
          HomeScreen()
        ],
      ),
      drawer:Drawer(
        child: ListView(
            children:<Widget>[

              UserAccountsDrawerHeader(
                  accountName: Text("kurniadi"),
                  accountEmail: Text("kurniadi@si.ukdw.ac.id"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "KK",
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
                      MaterialPageRoute(builder: (context) => DashboardMahasiswa(title:"Dashboard Mahasiswa")));
                },
              ),

              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title:"Dashboard Dosen")));
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(title: "Login",)));
                },
              ),
            ]
        ),
      ),
    );
  }
}