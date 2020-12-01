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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
                accountName: Text("Ristri Krisnugraheni"),
                accountEmail: Text("ristri.krisnugraheni@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Text(
                    "RK",
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
                trailing: Icon(Icons.book_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal"))
                  );
                },
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
            child: ListView(
              children: <Widget>[
              ],
            ),
          ),
        )
    );
  }
}