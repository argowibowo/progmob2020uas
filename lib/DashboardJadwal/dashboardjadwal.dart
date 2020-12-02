import 'package:flutter/material.dart';

class dashboardjadwal extends StatefulWidget {
  dashboardjadwal({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardjadwalState createState() => _dashboardjadwalState();
}
class _dashboardjadwalState extends State<dashboardjadwal> {
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
                  leading: Icon(Icons.schedule_outlined),
                  title: Text("[SI3333] PEMOGRAMAN MOBILE GRUP D( 3 SKS )"),
                  subtitle: Text("JUMAT, 09:30 - 11:20 WIB "),
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