import 'package:flutter/material.dart';

class Matkul extends StatefulWidget {   //<~~~
  Matkul({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _MatkulState createState() => _MatkulState();   //<~~~
}

class _MatkulState extends State<Matkul> {    //<~~~~


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
                        title: Text("Hari"),     //<~~~~~~
                        subtitle: Text("Hari Rabu Sesi 2"),    //<~~~~
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