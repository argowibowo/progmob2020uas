import 'package:flutter/material.dart';
import 'package:flutter_progmob/bottomnav.dart';
import 'package:flutter_progmob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_progmob/TugasPertemuan1.dart';



class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  title: Text("Adrian Stefano"),
                  subtitle: Text("72180186 - adrian@mail.com"),
                  trailing: PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                          child: const Text('Update'), value:'Doge'),
                      new PopupMenuItem<String>(
                          child: const Text('Delete'), value:'Doge'),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}