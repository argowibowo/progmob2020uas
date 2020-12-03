import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Dashboardmhs extends StatefulWidget {
  Dashboardmhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardmhsState createState() => _DashboardmhsState();
}

class _DashboardmhsState extends State<Dashboardmhs> {
  final _formKey = GlobalKey<FormState>();

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body:Container(
        child:GestureDetector(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min ,
                children:<Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Mikhael Effandito Wicaksana"),
                    subtitle: Text("72180262-Sistem Informasi 2018"),
                    trailing: PopupMenuButton(
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                        new PopupMenuItem<String>(
                            child:  const Text('Update'),value: 'Update'),
                        new PopupMenuItem<String>(
                            child:  const Text('Delete'),value: 'Delete'),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}