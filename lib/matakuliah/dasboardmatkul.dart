import 'package:flutter/material.dart';
class Dashboardmatkul extends StatefulWidget {
  Dashboardmatkul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardmatkulState createState() => _DashboardmatkulState();
}

class _DashboardmatkulState extends State<Dashboardmatkul> {
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
                      leading: Icon(Icons.book),
                      title: Text(" Matakuliah Konsentrasi"),
                      subtitle: Text(" Data Mining "),
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