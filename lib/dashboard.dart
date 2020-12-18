import 'package:flutter/material.dart';
import 'package:progmob_flutter/dosen/dashboarddosen.dart';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/mahasiswa/dashboardmahasiswa.dart';
import 'package:progmob_flutter/matakuliah/dashboardmatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index){
    setState((){
      _selectedTabIndex = index;
    });
  }


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget> [
      DashboardMahasiswa(title: "Mahasiswa"),
      DashboardDosen(title: "Dosen"),
      DashboardMataKuliah(title: "Mata Kuliah"),
    ];

    final __bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text('Mahasiswa'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text('Dosen'),
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.library_books),
        title: Text('Mata Kuliah'),

      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.schedule_outlined),
        title: Text('Jadwal'),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: __bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Anisya Clara Br Sitinjak"),
              accountEmail: Text("anisya.clara@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "AC",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Halo",)),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _listPage [_selectedTabIndex]
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}