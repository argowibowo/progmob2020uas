import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ronaldo_flutter_progmob_2020/dosendata.dart';
import 'package:ronaldo_flutter_progmob_2020/jadwaldata.dart';
import 'package:ronaldo_flutter_progmob_2020/login.dart';
import 'package:ronaldo_flutter_progmob_2020/mahasiswadata.dart';
import 'package:ronaldo_flutter_progmob_2020/matakuliahdata.dart';
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
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[700],
      drawer: Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ronaldo21"),
                accountEmail: Text("ronaldo.engelbert@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "R21",
                    style: TextStyle(fontSize: 40.0),
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
              color: Colors.blue[700],
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title: "Data Dosen"))
                  );
                },
                splashColor: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0, color: Colors.red),
                      Text("Dosen", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue[700],
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMhs(title: "Data Mahasiswa"))
                  );
                },
                splashColor: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outline, size: 70.0, color: Colors.red),
                      Text("Mahasiswa", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue[700],
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Data Matakuliah"))
                  );
                },
                splashColor: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_sharp, size: 70.0, color: Colors.red),
                      Text("Matakuliah", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue[700],
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal"))
                  );
                },
                splashColor: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.schedule, size: 70.0, color: Colors.red),
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