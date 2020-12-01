import 'package:flutter/material.dart';
class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
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
                    title: Text("Jong Jek Siang"),
                    subtitle: Text("7200001 - jjs@staff.ukdw.ac.id"),
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