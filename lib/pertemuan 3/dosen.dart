import 'package:flutter/material.dart';

class Dosen extends StatefulWidget {
  Dosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DosenState createState() => _DosenState();
}

class _DosenState extends State<Dosen> {

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
                title: Text("Argo Wibowo"),
                subtitle: Text("Dosen Matakuliah Progweb"),
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
                title: Text("Katon Wijana"),
                subtitle: Text("Dosen Matakuliah Aplikasi Berbasis Dekstop"),
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