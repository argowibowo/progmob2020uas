import 'package:flutter/material.dart';
import 'package:flutter_progmob/home.dart';
import 'package:flutter_progmob/TugasPertemuan1.dart';

class bottomnav extends StatefulWidget {
  bottomnav({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _bottomnavState createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    homepg(),
    Tgspertemuan1()
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap:  onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
              title: new Text('Account')
          )
        ],
      ),
    );
  }
}
