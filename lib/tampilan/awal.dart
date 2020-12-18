import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/dosen/dashboardDosen.dart';
import 'package:flutter_progmob_app/jadwal/dashboardJadwal.dart';
import 'package:flutter_progmob_app/mahasiswa/dashboardMhs.dart';
import 'package:flutter_progmob_app/matakuliah/dashboardMatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../splashScreen.dart';

class Awal extends StatefulWidget {
  Awal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AwalState createState() => _AwalState();
}
class _AwalState extends State<Awal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       title: Text('Menu'),
     ),
      backgroundColor: Colors.lightBlue[100],
      body: Container(
        padding: EdgeInsets.all(30.0),

        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMhs(title: "Mahasiswa",)),
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people, size: 70.0,),
                      Text("Mahasiswa", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dosen",)),
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.people_outlined, size: 70.0,),
                      Text("Dosen", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah",)),
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.book_online_outlined, size: 70.0,),
                      Text("MataKuliah", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Jadwal",)),
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.calendar_view_day, size: 70.0,),
                      Text("Jadwal", style : new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nikita Semben"),
              accountEmail: Text("nikita@mail"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "NS",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Profil"),
              trailing: Icon(Icons.people),
              subtitle: Text("Mahasiswa"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Tentang"),
              trailing: Icon(Icons.info),
              subtitle: Text("Tentang Informasi"),
              onTap: (){},
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
              subtitle: Text("Keluar"),
              onTap: ()async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Push aja",)),
                );
              },
            ),
          ],
        ),
      ),
      );
  }
}

