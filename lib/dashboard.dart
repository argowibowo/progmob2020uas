import 'package:flutter/material.dart';
import 'package:flutter_2020/dosen/Dashboarddos.dart';
import 'package:flutter_2020/jadwal/dashboardjadwal.dart';
import 'package:flutter_2020/mahasiswa/dashboardmhs.dart';
import 'package:flutter_2020/matakuliah/dashboardmatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}
class Dasbrd extends StatefulWidget {
  Dasbrd({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DasbrdState createState() => _DasbrdState();
}

class _DasbrdState extends State<Dasbrd> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("validated");
    }else{
      print("failed");
    }
  }
  var dashbrd = [
    "Data Mahasiswa",
    "Data Dosen",
    "Pilihan Mata Kuliah",
    "Jadwal Kuliah"
  ];
  var images = [
    "assets/lmaha.png",
    "assets/ldosen.png",
    "assets/lbuku.png",
    "assets/ljadwal.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
        drawer: Drawer(
         child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
             accountName: Text("Mikhael Effandito"),
             accountEmail: Text("mikhael.effandito@si.ukdw.ac.id"),
             currentAccountPicture : CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
              "ME",
              style :TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Data Dosen"),
            trailing: Icon(Icons.people),
            subtitle: Text("Menu CRUD Data Dosen"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder:(context) => DashBoardDosen(title: "Dashboard Dosen",)),
              );
            },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => dashboardmhs(title:"Dashboard Mahasiswa",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              trailing: Icon(Icons.library_books),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => dashboardmatakuliah(title:"Dashboard Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              trailing: Icon(Icons.schedule),
              subtitle: Text("Menu CRUD Data Jadwal"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => Dashboardjad(title:"Dashboard Jadwal,")),
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
              trailing: Icon(Icons.exit_to_app_outlined),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is login", 1);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                );
              },
            ),
          ],
        ),
       ),
      body: Container(
        child:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index < 4) {
              return Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(images[index], height: 89, width: 89),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(dashbrd[index], style: TextStyle(
                          fontSize: 13.5, height: 1.2, fontWeight: FontWeight
                          .bold),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              );
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}




