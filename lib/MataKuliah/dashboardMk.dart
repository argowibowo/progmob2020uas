import 'package:flutter/material.dart';

class dashboardMk extends StatefulWidget {
  dashboardMk({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dashboardMkState createState() => _dashboardMkState();
}

class _dashboardMkState extends State<dashboardMk> {

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
                        leading: Icon(Icons.book),
                        title: Text("Manajemen Proyek"),
                        subtitle: Text("Rabu, 11.30 - 13.20"),
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