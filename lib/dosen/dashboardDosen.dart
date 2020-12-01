import 'package:flutter/material.dart';
class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardDosenState createState()=> _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen>{
  int _counter = 2;

  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},)
        ],
      ),
      body:Container(
            child:Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Jong Jek Siang"),
                    subtitle : Text("123456 - jjs@staff.ukdw.ac.id"),
                  )
                ],
              )
          ),
        ),
    );
  }
}
