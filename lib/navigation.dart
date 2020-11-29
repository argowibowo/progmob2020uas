import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/pertemuan1.dart';
import 'package:flutter_progmob_2020/home.dart';
import 'package:flutter_progmob_2020/setting.dart';

class navigation extends StatefulWidget {
  navigation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _navigationState createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    home(),
    Pertemuan1(title: 'Dashboard',),
    setting()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_rounded),
            title: new Text('Home')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle_rounded),
              title: new Text('Profile')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: new Text('Setting')
          ),
        ],
      ),
    );
  }
}
