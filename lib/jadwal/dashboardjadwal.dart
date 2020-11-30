import 'package:flutter/material.dart';
import 'package:flutter_progmob/main.dart';
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
                      title: Text("Senin"),
                      subtitle: Text("07.30 - Aplikasi Berbasis Desktop"),
                      trailing: PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Update'), value: 'Doge'),
                          new PopupMenuItem<String>(
                            child: const Text('Delete'), value: 'Lion',
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