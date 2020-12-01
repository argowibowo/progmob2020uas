import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget {
  DashboardDosen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}
class _DashboardDosenState extends State<DashboardDosen> {
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
                  title: Text("Argo Wibowo, S. Kom., M.T."),
                  subtitle: Text("0512E392- argo@staff.ukdw.ac.id"),
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