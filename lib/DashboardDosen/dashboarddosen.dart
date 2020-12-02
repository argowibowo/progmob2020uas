import 'package:flutter/material.dart';

class dashboardosen extends StatefulWidget {
  dashboardosen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboarddosenState createState() => _dashboarddosenState();
}
class _dashboarddosenState extends State<dashboardosen> {
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
                  title: Text("Jong Jek Siang"),
                  subtitle: Text("08476432567 - jjs@staff.ukdw.ac.id"),
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