import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gridDashboard.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  final String title;
  String nimnik;
  Dashboard({Key key, @required this.title, @required this.nimnik}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(title, nimnik);
}

class _DashboardState extends State<Dashboard> {
  final String title;
  String nimnik;

  _DashboardState(this.title, this.nimnik);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Dashboard"),
      ),
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
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
                      "Welcome,",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(nimnik,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    RaisedButton(
                        color: Colors.redAccent,
                        child: Text("Logout",
                            style: TextStyle(
                                color:Colors.white)),
                        onPressed:() async {
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          await pref.setInt("is_login", 0);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(title: "Login"))
                          );
                        }),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }

  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Rico Alex Sandra"),
                accountEmail: Text("rico.alex@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("RAS",style: TextStyle(fontSize: 30.0)),
                ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.person),
              subtitle: Text("Menu Data Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dasboard Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu Data Mahasiwa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dasboard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.calendar_today_outlined),
              subtitle: Text("Menu Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dasboard Matakuliah"))
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
                  context, MaterialPageRoute(builder: (context) => login(title: "Login"))
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
  }*/
}