import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDataDosen extends StatefulWidget {
  DashboardDataDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDataDosenState createState() => _DashboardDataDosenState();
}

class _DashboardDataDosenState extends State<DashboardDataDosen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {}
          )
        ],
      ),

      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Willy Sudiarto Raharjo, S.Kom., M.Cs"),
                subtitle: Text("104E341 - willy.sr@staff.ukdw.ac.id"),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                      child: const Text('Update'), value: 'Update',
                    ),
                    new PopupMenuItem<String>(
                      child: const Text('Delete'), value: 'Delete',
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Drs. Jong Jek Siang, M.Sc."),
                subtitle: Text("104E344 - jjs@staff.ukdw.ac.id"),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                      child: const Text('Update'), value: 'Update',
                    ),
                    new PopupMenuItem<String>(
                      child: const Text('Delete'), value: 'Delete',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}