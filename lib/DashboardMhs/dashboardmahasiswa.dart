import 'package:flutter/material.dart';

class dashboardmahasiswa extends StatefulWidget {
  dashboardmahasiswa({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardmahasiswaState createState() => _dashboardmahasiswaState();
}
class _dashboardmahasiswaState extends State<dashboardmahasiswa> {
  final _formKey = GlobalKey<FormState>();
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
                  title: Text("Elza Miyori"),
                  subtitle: Text("72180214 - elza.miyori@si.ukdw.ac.id"),
                  trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                        child: const Text('Update'), value: 'Update',
                      ),
                      new PopupMenuItem<String>(
                        child: const Text('Delete'), value: 'Delete',
                      ),
                      new PopupMenuItem<String>(
                        child: const Text('Edit'), value: 'Edit',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}