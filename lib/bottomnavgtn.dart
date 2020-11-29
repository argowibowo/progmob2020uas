import 'package:flutter/material.dart';
import 'package:simpelproject/abt.dart';
import 'package:simpelproject/home.dart';
import 'package:simpelproject/tugaspertemuan8.dart';




class bottomnavgtn extends StatefulWidget {
  bottomnavgtn({Key key, this.title}) : super(key: key);
  final String title;
  @override
  bottomnavgtnState createState() => bottomnavgtnState();
}

class bottomnavgtnState extends State<bottomnavgtn> {
  int currentIndex = 0;
  final List<Widget> _children = [
    home(),
    FormScreen(),
    abt()
  ];

  void onTappedBar(int index){
    setState(() {
      currentIndex= index;
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
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap:  onTappedBar,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home_sharp),
              // ignore: deprecated_member_use
              title: new Text('Homepage')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings_applications_sharp),
              // ignore: deprecated_member_use
              title: new Text('Setting')
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.info_rounded),
              // ignore: deprecated_member_use
              title: new Text('About Application')
          )
        ],
      ),
    );
  }
}