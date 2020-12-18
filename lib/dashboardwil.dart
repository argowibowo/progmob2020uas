import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Login.dart';
import 'package:wil_app/dosen/dashboard_dosen.dart';
import 'package:wil_app/jadwal/dashboard_jadwal.dart';
import 'package:wil_app/mahasiswa/dashboard_mahasiswa.dart';
import 'package:wil_app/matakuliah/dashboard_matakuliah.dart';
import 'package:wil_app/apiservices.dart';
import 'package:wil_app/model.dart';


class Dashboardwil extends StatefulWidget {
  Dashboardwil({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _DashboardwilState createState() => _DashboardwilState();
}

class _DashboardwilState extends State<Dashboardwil> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Informasi Akademik"),

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Wilfridus Bau Mau "),
              accountEmail: Text("wilfridus.bau@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "WM",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Data Dosen",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),

              trailing: Icon(
                Icons.people,
                color: Colors.purple,
              ),
              subtitle: Text(
                "Menu CRUD Data Dosen",
                style: TextStyle(
                  color:Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Menu Dosen",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Mahasiswa",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.people_alt_outlined,
                color: Colors.purple,
              ),
              subtitle: Text(
                "Menu CRUD Data Mahasiswa",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Menu Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Matakuliah",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.library_books,
                color: Colors.purple,
              ),
              subtitle: Text(
                "Menu CRUD Data Matakuliah",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard_matakuliah(title: "Menu Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Jadwal",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.schedule,
                color: Colors.purple,
              ),
              subtitle: Text(
                "Menu CRUD Data Jadwal",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardJadwal(title: "Menu Jadwal",)),
                );
              },
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Colors.purple,
              ),
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login Sistem Akademik",)),
                );
              },
            ),
          ],

        ),
      ),
      //Future masukin disini bodynya
      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.deepPurple,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(

              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard_dosen(title : "Data Dosen",)),
                  );
                },



                splashColor: Colors.green,
                child: Center(
                  child: Column(

                    children: <Widget>[
                      Icon(Icons.person_pin, size:70.0, color:Colors.amber),
                      Text("Dosen", style : new TextStyle(fontSize: 17.0)),
                      Text("Aktif 4", style : new TextStyle(fontSize: 17.0)),

                    ],

                  ),
                ),

              ),

            ),
            Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardMahasiswa(title : "Data Mahasiswa",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(

                    children: <Widget>[
                      Icon(Icons.person_pin, size:70.0, color:Colors.deepOrange),
                      Text("Mahasiswa", style : new TextStyle(fontSize: 17.0)),
                      Text("Aktif 1", style : new TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard_matakuliah(title : "Data Matakuliah",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(

                    children: <Widget>[
                      Icon(Icons.library_books, size:70.0, color: Colors.lightBlue),
                      Text("Matakuliah", style : new TextStyle(fontSize: 17.0)),
                      Text("Aktif 1", style : new TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoardJadwal(title : "Data Jadwal",)),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(

                    children: <Widget>[
                      Icon(Icons.school, size:70.0, color: Colors.green),
                      Text("Perkuliahan", style : new TextStyle(fontSize: 17.0)),
                      Text("Aktif 1", style : new TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}