import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardmhs extends StatefulWidget {
  Dashboardmhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardmhsState createState() => _DashboardmhsState();
}

class _DashboardmhsState extends State<Dashboardmhs> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
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
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Nam Do San"),
                    subtitle: Text("089876543210 - dosan@gmail.com"),
                    onLongPress: (){
                      showDialog(
                          context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlatButton(
                              child: Text("Update"),
                              onPressed: (){
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UpdateMhs(title: "Input Data Mahasiswa")).then(onGoBack);
                                )
                              },
                            ),
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: () async {
                                ApiServices()deleteMhs(lMhs[position].nim);
                                Navigator.pop(context);
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ));
                    },
                  )
                ],
              ),
            )
        ),
      );
  }
}
