import 'package:flutter/material.dart';

class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
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
                    leading: Icon(Icons.person),
                    title:Text("Yose Awanaustus Salawangi"),
                    subtitle: Text("72180217 - yose.asalawangi@si.ukdw.ac.id"),
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