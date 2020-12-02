import 'package:flutter/material.dart';

class DashMhs extends StatefulWidget {
  DashMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashMhsState createState() => _DashMhsState();
}

class _DashMhsState extends State<DashMhs> {

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
                        title: Text("Billianro Sember"),
                        subtitle: Text("082177268019 - billianro.sember@si.ukdw.ac.id"),
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