import 'package:flutter/material.dart';
import 'package:flutter_72180249/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardJadwal extends StatefulWidget {
  DashboardJadwal({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardJadwalState createState() => _DashboardJadwalState();
}

class _DashboardJadwalState extends State<DashboardJadwal> {
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
          )
        ],
      ),
      body: Container(
          child: GestureDetector(
            child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text("Jumat"),
                      subtitle: Text("09.30 - Pemograman Mobile"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Up'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Del',
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          )
      ),
    );

  }
}