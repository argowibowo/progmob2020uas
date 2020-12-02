import 'package:flutter/material.dart';

class dashboardmatkul extends StatefulWidget {
  dashboardmatkul({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardmatkulState createState() => _dashboardmatkulState();
}
class _dashboardmatkulState extends State<dashboardmatkul> {
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
                  leading: Icon(Icons.library_books),
                  title: Text("[SI3333] PEMOGRAMAN MOBILE GRUP D( 3 SKS )"),
                  subtitle: Text("Argo Wibowo,S.T.,M.T."),
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