import 'package:flutter/material.dart';

class Jadwal extends StatefulWidget {   //<~~~
  Jadwal({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _JadwalState createState() => _JadwalState();   //<~~~
}

class _JadwalState extends State<Jadwal> {    //<~~~~


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){}
          )
        ],
      ),
      body: Container(
          child: GestureDetector(
            child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text("RUANG"),     //<~~~~~~
                        subtitle: Text("A.2.3"),    //<~~~~
                        trailing: PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(
                                child: const Text('Delete'), value: 'Delete'),
                          ],
                        )
                    )
                  ],
                )
            ),
          )
      ),
    );
  }
}