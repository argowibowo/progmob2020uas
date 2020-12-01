import 'package:flutter/material.dart';

class DashboardMatakuliah extends StatefulWidget {
  DashboardMatakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMatakuliahState createState() => _DashboardMatakuliahState();
}

class _DashboardMatakuliahState extends State<DashboardMatakuliah> {
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
              onPressed: (){},
            ),
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
                      title: Text("Keamanan Teknologi Informasi"),
                      subtitle: Text("SI3343"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                            child: const Text('Update'), value: 'Edit',
                          ),
                          new PopupMenuItem<String>(child: const Text('Delete'), value: 'Hapus',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}