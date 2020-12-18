import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/dosen/dashboardosen.dart';
import 'package:progmob2020_flutter/mahasiswa/dashboardmahasiswa.dart';
import 'package:progmob2020_flutter/splashLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmob2020_flutter/jadwal/dashboardjadwal.dart';
import 'package:progmob2020_flutter/matakuliah/dashboardmatakuliah.dart';

class Dashboard extends StatefulWidget{
  Dashboard ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard>{

  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Natasha Fortunata"),
                accountEmail: Text("natasha.fortunata@si.ukdw.ac.id"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "NF",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_alt_rounded, color: Colors.pinkAccent,),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa",))
                );
              },
            ),
            ListTile(
              title: Text("Data Dosen"),
              trailing: Icon(Icons.people_alt_rounded, color: Colors.pinkAccent,), //icon berada disebelah kanan
              subtitle: Text("Menu CRUD Data Dosen"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen",))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books_rounded, color: Colors.pinkAccent,), //icon berada disebelah kanan
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dashboard Matakuliah",))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule_rounded, color: Colors.pinkAccent,), //icon berada disebelah kanan
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal",))
                );
              },
            ),
            Divider( //membuat garis
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app, color: Colors.pinkAccent,),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashLogin(title: "Login"))
                );
              },
            ),
          ],
        )
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
          style: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 30
          ),
          ),
        ),
      ),

      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  
  
}