import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Jong Jek Siang",
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                  ),
                ),
                subtitle: Text(
                  "0516119002 - jjs@staff.ukdw.ac.id",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                //KALAU MENU UPDATE/DELETE NYA MAU PAKE TRAILING DI SAMPING KANAN CARANYA GINI
                /*trailing: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        child: const Text("Update"), value: 'Update'),
                    new PopupMenuItem<String>(
                        child: const Text("Delete"), value: "Delete"),
                  ],
                ),*/
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //pindah ke menu update
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                //pindah ke menu delete
                              },
                            ),
                          ],
                        ),
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}