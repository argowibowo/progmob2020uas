import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/abt.dart';
import 'package:progmob_flutter_2020/dashboard.dart';
import 'package:progmob_flutter_2020/home.dart';
import 'package:progmob_flutter_2020/main.dart';
import 'package:progmob_flutter_2020/tugas8.dart';

class bottomnavvgtn extends StatefulWidget {
  bottomnavvgtn({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _bottomnavvgtnState createState() => _bottomnavvgtnState();
}

class _bottomnavvgtnState extends State<bottomnavvgtn> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    home(),
    Tugas8(),
    abt()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex= index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      //body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //onTap:  onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home_work_outlined),
              title: new Text('Home')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle_sharp),
              title: new Text('Profile Setting')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.info_outline_rounded),
              title: new Text('About')
          )
        ],
      ),
      body: getBodyWidget(),
    );
  }
  getBodyWidget(){
    (_currentIndex==0)? Dashboard(): abt();
  }
}