import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/dosen/dashboardDosen.dart';
import 'package:flutter_progmob_app/jadwal/dashboardJadwal.dart';
import 'package:flutter_progmob_app/mahasiswa/dashboardMhs.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:flutter_progmob_app/matakuliah/dashboardMatkul.dart';
import 'package:flutter_progmob_app/tampilan/awal.dart';
import 'package:flutter_progmob_app/tampilan/profile.dart';
import 'package:flutter_progmob_app/tampilan/simpan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  int _seletedIndex = 0;
  final _layoutPage = [
    Awal(),
    Simpan(),
    Profile()
  ];
  void _onTabItem(int index){
    setState(() {
      _seletedIndex = index;
    });
  }

  @override
  void initState() {
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
              accountName: Text("Nikita Semben"),
              accountEmail: Text("nikita@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "NS",
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
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen",)),
            );
          },
        ),
          ListTile(
            title: Text("Data Mahasiswa"),
            trailing: Icon(Icons.people_outlined),
            subtitle: Text("Menu CRUD Data Mahasiswa"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa",)),
              );
            },
          ),
          ListTile(
            title: Text("Data Matakuliah"),
            trailing: Icon(Icons.book_online_outlined),
            subtitle: Text("Menu CRUD Data Matakuliah"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah",)),
              );
            },
          ),
          ListTile(
            title: Text("Data Jadwal"),
            trailing: Icon(Icons.schedule),
            subtitle: Text("Menu CRUD Data Jadwal"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal",)),
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
            subtitle: Text("Menu CRUD Data Jadwal"),
            onTap: ()async{
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 0);
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Push aja",)),
              );
            },
          ),
        ],
      ),
    ),
      // body: Container(
      //   child: Center(
      //     child: Text("Dashboard", style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      body: _layoutPage.elementAt(_seletedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Awal')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.save),
              title: Text('Simpan')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile')
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _seletedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}