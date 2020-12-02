import 'package:flutter/material.dart';

class DashJdwl extends StatefulWidget {
  DashJdwl({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashJdwlState createState() => _DashJdwlState();
}

class _DashJdwlState extends State<DashJdwl> {

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
                        title: Text("Jumat"),
                        subtitle: Text("Pemrograman Mobile"),
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