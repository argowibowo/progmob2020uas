import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_progmob_2020/datadosen.dart';
import 'package:flutter_progmob_2020/datajadwal.dart';
import 'package:flutter_progmob_2020/datamahasiswa.dart';
import 'package:flutter_progmob_2020/datamatakuliah.dart';
import 'package:flutter_progmob_2020/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Morgaan Haloho",
                style: TextStyle(color: Colors.black),
          ),
                accountEmail: Text("morgansh@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.white),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("images/logo2.png"),

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
        padding: EdgeInsets.all(40.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(9.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title: "Data Dosen"))
                  );
                },
                splashColor: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0, color: Colors.blue),
                      Text("Dosen", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(9.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMhs(title: "Data Mahasiswa"))
                  );
                },
                splashColor: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outline, size: 70.0, color: Colors.blue),
                      Text("Mahasiswa", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(9.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Data Matakuliah"))
                  );
                },
                splashColor: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_sharp, size: 70.0, color: Colors.blue),
                      Text("Matakuliah", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(9.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal"))
                  );
                },
                splashColor: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.schedule, size: 0.0, color: Colors.blue),
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