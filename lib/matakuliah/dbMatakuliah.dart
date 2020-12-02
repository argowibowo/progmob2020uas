import 'package:flutter/material.dart';

class DashMk extends StatefulWidget {
  DashMk({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashMkState createState() => _DashMkState();
}

class _DashMkState extends State<DashMk> {

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
                        title: Text("Pemrograman Mobile"),
                        subtitle: Text("Jumat, 09.30 - 11.30"),
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