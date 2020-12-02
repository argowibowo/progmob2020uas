import 'package:flutter/material.dart';
class Dashboarddosen extends StatefulWidget {
  Dashboarddosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboarddosenState createState() => _DashboarddosenState();
}

class _DashboarddosenState extends State<Dashboarddosen> {
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
                      leading: Icon(Icons.people),
                      title: Text("Yetli Oslan"),
                      subtitle: Text(" 0521387654 - yetli@staff.ukdw.ac.id"),
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