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
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ronaldo Merani"),
                accountEmail: Text("ronaldo.engelbert@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "R21",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Dosen"),
                subtitle: Text("Menu Dosen"),
                trailing: Icon(Icons.people),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dosen(title: "Data Dosen"))
                  );
                },
              ),
              ListTile(
                title: Text("Mahasiswa"),
                subtitle: Text("Menu Mahasiswa"),
                trailing: Icon(Icons.people_outline),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mahasiswa(title: "Data Mahasiswa"))
                  );
                },
              ),
              ListTile(
                title: Text("Matakuliah"),
                subtitle: Text("Menu Matakuliah"),
                trailing: Icon(Icons.book_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Matakuliah(title: "Data Matakuliah"))
                  );
                },
              ),
              ListTile(
                title: Text("Jadwal"),
                subtitle: Text("Menu Jadwal"),
                trailing: Icon(Icons.schedule),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal"))
                  );
                },
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

        body: Container(
          child: Center(
            child: Text("Home"),
          ),
        )
    );
  }
}