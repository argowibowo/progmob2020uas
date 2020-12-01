import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dosen extends StatefulWidget {
  @override
  _DosenState createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Dosen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
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
                    title: Text("Jong Jek siang"),
                    subtitle: Text("08127127 - jjs@gmail.com"),
                    trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return List<PopupMenuEntry<String>>()
                              ..add(PopupMenuItem<String>(
                                value: 'edit',
                                child: Text('Edit'),
                              ))
                              ..add(PopupMenuItem<String>(
                                value: 'delete',
                                child: Text('Delete'),
                              ));
                          },
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
