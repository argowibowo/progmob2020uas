
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/dashboarddosen.dart';
import 'package:flutter_app_1/dashboardjadwal.dart';
import 'package:flutter_app_1/dashboardmatkul.dart';
import 'package:flutter_app_1/dashboardmhs.dart';
import 'package:flutter_app_1/halamanlogin.dart';
import 'package:flutter_app_1/main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  Material MyItems (IconData icon,String heading, int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196f3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  //text
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //icon
                  Material(
                    color: new Color(color),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
          MyItems(Icons.list_rounded, "Daftar Nilai", 0xffed622b),
          MyItems(Icons.book, "KRS", 0xff26cb3c),
          MyItems(Icons.library_books, "KHS", 0xffff3266),
          MyItems(Icons.person_rounded, "Biodata", 0xff3399fe),
          MyItems(Icons.ad_units, "Layanan", 0xfff4c83f),
          MyItems(Icons.settings, "Layanan", 0xff622f74),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Nabiya Eltarani"),
                accountEmail: Text("nabiya.eltarani@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    "NE",
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
                  MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")),
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
                );
              },
            ),
            ListTile(
              title: Text("Jadwal"),
              trailing: Icon(Icons.schedule_outlined),
              subtitle: Text("Menu CRUD Jadwal"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")),
                );
              },
            ),
            ListTile(
              title: Text("Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Matakuliah"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah")),
                );
              },
            ),
            Divider(
              color: Colors.black87,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HalamanLogin(title: "Halo ",)),
                );
              },
             ),
          ],
        ),
    ),
    );
  }
}


