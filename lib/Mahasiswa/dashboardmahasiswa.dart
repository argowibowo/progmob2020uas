import 'package:flutter/material.dart';

class Mhs extends StatefulWidget {   //<~~~
  Mhs({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _MhsState createState() => _MhsState();   //<~~~
}

class _MhsState extends State<Mhs> {    //<~~~~


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
                        title: Text("Nama"),     //<~~~~~~
                        subtitle: Text("Hakkel.josia@si.ukdw.ac.id"),    //<~~~~
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