import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app_2020/Dosen/dashboarddosen.dart';
import 'package:flutter_app_2020/Jadwal/dashboardjadwal.dart';
import 'package:flutter_app_2020/Mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_app_2020/Matakuliah/dashboardmatakuliah.dart';
import 'package:flutter_app_2020/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        backgroundColor: Colors.brown[700],
      ),
      backgroundColor: Colors.red[100],
      drawer: Drawer(
        child: Container(
          color: Colors.red[100],
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Riswan Sulia Tritama"),
                accountEmail: Text("riswan.sulia@si.udkw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "images/ninny.png",
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 10,
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
                    MaterialPageRoute(builder: (context) => Login(title: "Halaman Login",)),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.red[100],
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashDsn(title: "Data Dosen"))
                  );
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0, color: Colors.black54),
                      Text("Dosen", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.red[100],
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashMhs(title: "Data Mahasiswa"))
                  );
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outline, size: 70.0, color: Colors.lightBlueAccent),
                      Text("Mahasiswa", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.red[100],
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashMk(title: "Data Matakuliah"))
                  );
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_sharp, size: 70.0, color: Colors.lightGreenAccent),
                      Text("Matakuliah", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.red[100],
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashJdwl(title: "Data Jadwal"))
                  );
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.schedule, size: 70.0, color: Colors.limeAccent),
                      Text("Jadwal", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}