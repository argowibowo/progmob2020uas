import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}
class _DashboardMhsState extends State<DashboardMhs> {
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
          actions: [
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
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Fransisca Fethy Angelina"),
                        subtitle: Text("72180185 - fransisca.fethy@si.ukdw.ac.id"),
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
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Delete"),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              )
                          );
                        },
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}