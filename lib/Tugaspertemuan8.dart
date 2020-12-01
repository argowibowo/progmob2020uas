import 'package:flutter/material.dart';
import 'package:flutter_72180247/pertemuan%202/login.dart';
import 'package:flutter_72180247/pertemuan%203/dosen.dart';
import 'package:flutter_72180247/pertemuan%203/jadwal.dart';
import 'package:flutter_72180247/pertemuan%203/mahasiswa.dart';
import 'package:flutter_72180247/pertemuan%203/matakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tugaspertemuan8 extends StatefulWidget{
  Tugaspertemuan8({Key key, this.title}):super(key:key);
  final String title;

  @override
  _Tugaspertemuan8 createState() => _Tugaspertemuan8();
}

class _Tugaspertemuan8 extends State<Tugaspertemuan8> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Christyanson"),
            accountEmail: Text("christyason@si.ukdw.ac.id"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "images/logo_splash.png",
                width: 200.0,
                height: 200.0,
              ),
            ),
          ),
          ListTile(
            title: Text("Data Dosen"),
            trailing: Icon(Icons.people),
            subtitle: Text("Menu CRUD Dosen"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dosen(title: "Data Dosen")),
              );
            },
          ),
          ListTile(
            title: Text("Data Mahasiswa"),
            trailing: Icon(Icons.person_outline),
            subtitle: Text("Menu CRUD Mahasiswa"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mahasiswa(title: "Data Mahasiswa")),
              );
            },
          ),
          ListTile(
            title: Text("Data Jadwal"),
            trailing: Icon(Icons.featured_play_list_rounded),
            subtitle: Text("Menu CRUD Jadwal"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Jadwal(title: "Data Jadwal")),
              );
            },
          ),
          ListTile(
            title: Text("Data MataKuliah"),
            trailing: Icon(Icons.list_alt),
            subtitle: Text("Menu CRUD MataKuliah"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Matakuliah(title: "Data MataKuliah")),
              );
            },
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
            onTap: () async{
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
      ),
      appBar: new AppBar(
        title: new Text("PROGMOB!?!?"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // TextField(),
                TextFormField(
                  decoration: new InputDecoration(
                    hintText: "contoh: Christyanson",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}