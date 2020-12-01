import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/dosen/dashboarddosen.dart';
import 'package:progmob_flutter_2020/jadwal/dashboardjadwal.dart';
import 'package:progmob_flutter_2020/mahasiswa/dashboardmhs.dart';
import 'package:progmob_flutter_2020/main.dart';
import 'package:progmob_flutter_2020/matakuliah/dashboardmatkul.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("validated");
    }else{
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
        child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Marcellus Davine Setiawan"),
                accountEmail: Text("marcellus.davine@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Text(
                    "MDS",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people_alt_outlined),
                subtitle: Text("Menu CRUD Data Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoardDosen(title: "Dashboard Dosen",)
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Data Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoardMhs(title: "Dashboard Mahasiswa",)
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.book_outlined),
                subtitle: Text("Menu CRUD Data Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoardMatkul(title: "Dashboard Mata Kuliah",)
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Data Jadwal Kuliah"),
                trailing: Icon(Icons.schedule_rounded),
                subtitle: Text("Menu CRUD Data Jadwal Kuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoardJadwal(title: "Dashboard Jadwal Kuliah"
                        "",)
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app_outlined),
                onTap: () async{
                  SharedPreferences pref = await  SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=> MyHomePage(title: "Tugas 10",)
                    ),
                  );
                },
              ),
            ]
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}