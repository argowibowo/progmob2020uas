import 'package:flutter/material.dart';

class dashboardMatakuliah extends StatefulWidget {
  dashboardMatakuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboardMatakuliahState createState() => _dashboardMatakuliahState();
}

class _dashboardMatakuliahState extends State<dashboardMatakuliah> {

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
                leading: Icon(Icons.school),
                title: Text("Pemrograman Berbasis Web"),
                subtitle: Text("SI3333"),
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
                leading: Icon(Icons.school),
                title: Text("Aplikasi Berbasis Dekstop"),
                subtitle: Text("S12363"),
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