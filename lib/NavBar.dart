import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/Dashboard.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter/cupertino.dart';
/*void main(){
  runApp(MaterialApp(
    title: 'Home',
    home: home(),
  ));
}*/

class NavBar extends StatefulWidget {
  NavBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  int _selectTabIndex = 0;

  List <Widget> _listPage = <Widget>[
    Home(),
    Dashboard(),
    Profile()
  ];

  void _onNavBarTapped (int index) {
    setState(() {
      _selectTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final _bottomNavBarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon:Icon(Icons.home),
        title:Text('Home')
      ),
      BottomNavigationBarItem(
          icon:Icon(Icons.dashboard),
          title:Text('Dashboard')
      ),
      BottomNavigationBarItem(
          icon:Icon(Icons.person),
          title:Text('Profile')
      )
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItem,
      currentIndex: _selectTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap:_onNavBarTapped,
    );

    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text("ProgMob"),
        centerTitle: true,
      ),
      body: Center(
        child: _listPage[_selectTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
