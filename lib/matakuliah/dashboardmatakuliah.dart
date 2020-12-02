import 'package:flutter/material.dart';

class DashboardMataKuliah extends StatefulWidget {
  DashboardMataKuliah({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMataKuliahState createState() => _DashboardMataKuliahState();
}

class _DashboardMataKuliahState extends State<DashboardMataKuliah> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
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
                  title: Text("[SE3313] E-COMMERCE A( 3 SKS )"),
                  subtitle: Text("Budi Sutedjo DO, S.Kom, M.M."),
                  trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                        child: const Text('Update'), value:'Update',
                      ),
                      new PopupMenuItem<String>(
                        child: const Text('Delete'), value:'Delete',
                      ),
                      new PopupMenuItem<String>(
                        child: const Text('Edit'), value:'Edit',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
