import 'package:flutter/material.dart';
class Dashboardjadwal extends StatefulWidget {
  Dashboardjadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardjadwalState createState() => _DashboardjadwalState();
}

class _DashboardjadwalState extends State<Dashboardjadwal> {
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
                      leading: Icon(Icons.schedule),
                      title: Text("Komunikasi Antar Personal  "),
                      subtitle: Text("Selasa : 9.30-11.30 "),
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