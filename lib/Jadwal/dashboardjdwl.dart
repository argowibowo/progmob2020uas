import 'package:flutter/material.dart';

class DashboardJdwl extends StatefulWidget {
  DashboardJdwl({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardJdwlState createState() => _DashboardJdwlState();
}

class _DashboardJdwlState extends State<DashboardJdwl> {
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
                    leading: Icon(Icons.schedule),
                    title:Text("Kamis, 17:30 - 19.20"),
                    subtitle: Text("E-Commerce - Budi Sutedjo DO, S.Kom, M.M."),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}