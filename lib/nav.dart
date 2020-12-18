import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/dosen/dashboardDosen.dart';
import 'package:progmob_flutter/jadwal/dashboardJadwal.dart';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMhs.dart';
import 'package:progmob_flutter/matakuliah/dashboardMatkul.dart';
import 'package:progmob_flutter/logout.dart';

class Nav extends StatefulWidget {
  Nav({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavState createState() => _NavState();
}


class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    DashboardMhs(),
    DashboardDsn(),
    DashboardMatkul(),
    Logout(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'Dashboard',
              ),
              backgroundColor: Colors.deepOrange
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outlined,
            ),
            title: Text(
              'Mahasiwa',
            ),
            backgroundColor: Colors.deepOrange
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            title: Text(
              'Dosen',
            ),
              backgroundColor: Colors.deepOrange
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            title: Text(
              'Matakuliah',
            ),
              backgroundColor: Colors.deepOrange
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              title: Text(
                'Logout',
              ),
              backgroundColor: Colors.deepOrange
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}