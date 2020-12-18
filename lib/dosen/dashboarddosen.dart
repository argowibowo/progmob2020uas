import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboarddosen extends StatefulWidget {
  dashboarddosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboarddosenState createState() => _dashboarddosenState();
}

class _dashboardDosenState extends State<dashboarddosen> {
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
              onPressed: () {}
          )
        ],
      ),

      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Katon Wijana, S.Kom., M.T."),
                subtitle: Text("0921E23 - katon@staff.ukdw.ac.id"),
                // CARA 1
                // onLongPress: () {
                //   showDialog(
                //       context: context,
                //       builder: (_) => AlertDialog(
                //         content: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             FlatButton(
                //                 onPressed: (){
                //                   Navigator.pop(context);
                //                 },
                //                 child: Text("Update")
                //             ),
                //             FlatButton(
                //                 onPressed: (){
                //                   Navigator.pop(context);
                //                 },
                //                 child: Text("Delete")
                //             ),
                //           ],
                //         ),
                //       )
                //   );
                // },
                // CARA 2
                trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                      child: const Text('Update'), value: 'Update',
                    ),
                    new PopupMenuItem<String>(
                      child: const Text('Delete'), value: 'Delete',
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Argo Wibowo, S.Kom., M.T."),
                subtitle: Text("0512E392 - argo@staff.ukdw.ac.id"),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                      child: const Text('Update'), value: 'Update',
                    ),
                    new PopupMenuItem<String>(
                      child: const Text('Delete'), value: 'Delete',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}