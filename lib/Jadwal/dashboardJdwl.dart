import 'package:flutter/material.dart';

class dashboardJdwl extends StatefulWidget {
  dashboardJdwl({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardJdwlState createState() => _dashboardJdwlState();
}

class _dashboardJdwlState extends State<dashboardJdwl> {

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
                        leading: Icon(Icons.schedule),
                        title: Text("Rabu"),
                        subtitle: Text("Manajemen Proyek"),
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