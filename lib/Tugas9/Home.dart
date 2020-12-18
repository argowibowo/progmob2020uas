import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Tugas10/DataDosen.dart';
import 'package:flutter_app/Tugas10/DataMahasiswa.dart';
import 'package:flutter_app/Tugas10/DataMatakuliah.dart';
import 'package:flutter_app/Tugas10/MenuJadwal.dart';
import 'package:flutter_app/Tugas9/Login.dart';
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
          title: Text("MENU CRUD"),
          backgroundColor: Colors.blue[700],
        ),
      backgroundColor: Colors.blueAccent[100],
      //menu drawernya
      drawer: Drawer(
        child: Container(
          color: Colors.blue[100],
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("RISTRI KRISNUGRAHENI", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                accountEmail: Text("ristri.krisnugraheni@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://ssat.ukdw.ac.id/_photos/informasi/72180204.jpg"),
                ),
                decoration: new BoxDecoration(color: Colors.lightBlueAccent[700]),
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

      //menu dashboard
      body: Container(
        padding: EdgeInsets.all(30.0),
        child:
        GridView.count(crossAxisCount: 2,
          children: <Widget> [
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title: "Data Dosen"))
                  );
                },
                splashColor: Colors.purpleAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.account_circle_sharp, size:70.0,),
                      Text("Dosen", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMhs(title: "Data Mahasiswa"))
                  );
                },
                splashColor: Colors.purpleAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.account_circle_rounded, size:70.0,),
                      Text("Mahasiswa", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Data Matakuliah"))
                  );
                },
                splashColor: Colors.purpleAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.bookmark, size:70.0,),
                      Text("Mata Kuliah", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal"))
                  );
                },
                splashColor: Colors.purpleAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.watch_later_sharp, size:70.0,),
                      Text("Jadwal", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );



  }
}