import 'package:flutter/material.dart';
class DashboardMahasiswa extends StatefulWidget{
  DashboardMahasiswa({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardMahasiswaState createState()=> _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa>{
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
                  leading: Icon(Icons.people_outlined),
                  title: Text("Elbie Reyova"),
                  subtitle : Text("72180196 - elbie.reyova@si.ukdw.ac.id"),
                )
              ],
            )
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child : Icon(Icons.add),
      ),*/
    );
  }
}
