import 'package:flutter/material.dart';

class DashMk extends StatefulWidget {
  DashMk({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashMkState createState() => _DashMkState();
}

class _DashMkState extends State<DashMk> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){}
          )
        ],
      ),
      /*drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Riswan S. Tritama"),
              accountEmail: Text("riswan.sulia@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "Ha",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            )
          ],
        ),
      ),*/
      body: Container(
          child: GestureDetector(
            child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.book),
                        title: Text("Keamanan Teknologi Informasi"),
                        subtitle: Text("Senin, 11.30 - 13.20"),
                        trailing: PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(
                                child: const Text('Delete'), value: 'Delete'),
                          ],
                        )
                      /*onLongPress: (){ //<~ /*
                        showDialog(context: null,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  children: <Widget>[
                                    FlatButton(
                                        child: Text("Edit"),
                                        onPressed: (){
                                          Navigator.pop(context); //<~ */
                                        })
                                  ],
                                ),
                              );
                            });
                      },*/
                    )
                  ],
                )
            ),
          )
      ),
    );
  }
}