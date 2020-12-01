import 'package:flutter/material.dart';

class DashboardDsn extends StatefulWidget {
  DashboardDsn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDsnState createState() => _DashboardDsnState();
}

class _DashboardDsnState extends State<DashboardDsn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions:<Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
            )
          ],
        ),
      body: Container(
        child : GestureDetector(
          child: Card(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  ListTile(
                    leading: Icon(Icons.people),
                    title:Text("Budi Sutedjo DO, S.Kom, M.M."),
                    subtitle: Text("109E235 - budi.sutedjo@staff.ukdw.ac.id"),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}