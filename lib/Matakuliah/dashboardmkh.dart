import 'package:flutter/material.dart';

class DashboardMkh extends StatefulWidget {
  DashboardMkh({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMkhState createState() => _DashboardMkhState();
}

class _DashboardMkhState extends State<DashboardMkh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions:<Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            )
          ],
        ),
        body: Container(
          child : GestureDetector(
            child: Card(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  ListTile(
                    leading: Icon(Icons.assignment_outlined),
                    title:Text("E-Commerce"),
                    subtitle: Text("3 SKS - Budi Sutedjo DO, S.Kom, M.M."),
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
          ),
        ),
    );
  }
}