import 'package:flutter/material.dart';
class DashboardMatakuliah extends StatefulWidget{
  DashboardMatakuliah({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardMatakuliahState createState()=> _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah>{
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
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddMatakuliah(title:"Tambah Matakuliah"))
              ).then(onGoBack);
            },)
        ],
      ),
      body:Container(
        child:Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.article),
                  title: Text("Pemrograman Mobile"),
                  subtitle : Text("[SI3333] - Jumat, 09.30 - 11.20 WIB"),
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
