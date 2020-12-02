import 'package:flutter/material.dart';

class Dsn extends StatefulWidget {   //<~~~
  Dsn({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _DsnState createState() => _DsnState();   //<~~~
}

class _DsnState extends State<Dsn> {    //<~~~~


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
                        title: Text("Argo Wibowo"),     //<~~~~~~
                        subtitle: Text("ArgoWibowo@staff.si.ukdw.ac.id"),    //<~~~~
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