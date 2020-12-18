import 'package:flutter/material.dart';
import 'package:flutter_72180249/dosen/DashboardDosen.dart';
import 'package:flutter_72180249/jadwal/DashboardJadwal.dart';
import 'package:flutter_72180249/login.dart';
import 'package:flutter_72180249/mahasiswa/DashboardMahasiswa.dart';
import 'package:flutter_72180249/main.dart';
import 'package:flutter_72180249/login.dart';
import 'package:flutter_72180249/matakuliah/DashboardMatKul.dart';
import "package:shared_preferences/shared_preferences.dart";

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget> [
              UserAccountsDrawerHeader(
                accountName: Text("Nanda Meliana"),
                accountEmail: Text("meliana.nanda18@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "DP",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people_alt),
                subtitle: Text("Menu CRUD Data Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen",)),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outline),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dashboard Mahasiswa",)),
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.library_books_outlined),
                subtitle: Text("Menu CRUD Data Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Mata Kuliah",)),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu CRUD Data Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal",)),
                  );
                },
              ),
              Divider(
                color: Colors.black45,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Hello Push",)),
                  );
                },

              )
            ],
          ),
        ),
        body: Container(
            child:Center(
                child: Text("Dashboard",
                    style: TextStyle(
                        fontSize: 20
                    )
                )
            )
        )
    );
  }
}