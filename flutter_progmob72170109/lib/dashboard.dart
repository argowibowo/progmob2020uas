
import 'package:flutter/material.dart';
import 'package:flutter_progmob72170109/Login.dart';
import 'package:flutter_progmob72170109/dosen/DashboardCRUDDosen.dart';
import 'package:flutter_progmob72170109/jadwal/DashboardCRUDJadwal.dart';
import 'package:flutter_progmob72170109/mahasiswa/DashboardCRUDMahasiswa.dart';
import 'package:flutter_progmob72170109/matakuliah/DashboardCRUDMatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //return Text("Splash Screen");
    return Scaffold(
      appBar: AppBar(
      ),
          drawer: Drawer(
            child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
    accountName: Text("Melsiora Saniba fernandes"),
    accountEmail: Text("melsiora.saniba@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "MF",
                    style: TextStyle(fontSize: 44.0),
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
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dboard Dosen",)),
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
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Dboard Mahasiswa",)),
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
                    MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dboard Mata Kuliah",)),
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
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dboard Jadwal",)),
                  );
                },
              ),
              Divider(
                color: Colors.pinkAccent,
                height: 22,
                indent: 12,
                endIndent: 12,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login(title: "heyy Push",)),
                  );
                },

              )
            ],

            ),
          ),
        body: Container(
            child:Center(
                child: Text("Selamat Datang Di Dashboard",
                    style: TextStyle(
                        fontSize: 22
                    )
                )
            )
        )
    );
  }
}