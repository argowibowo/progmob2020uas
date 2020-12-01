import 'package:flutter/material.dart';
class DashboardJadwal extends StatefulWidget{
  DashboardJadwal({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardJadwalState createState()=> _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal>{
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
                  leading: Icon(Icons.schedule),
                  title: Text("Pemrograman Mobile"),
                  subtitle : Text("[SI3333] - Jumat, 09.30 - 11.20 WIB"),
                ),
                ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text("Keamanan Teknologi Informasi"),
                  subtitle : Text("[SI3343] - Senin, 11.30 - 13.20 WIB"),
                )
              ],
            )
        ),
      ),

    );
  }
}
