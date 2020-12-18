
import 'package:flutter/material.dart';
import 'package:flutter_app/CRUD/dosen/datadosen.dart';
import 'package:flutter_app/CRUD/jadwal/datajadwal.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/CRUD/mahasiswa/datamahasiswa.dart';
import 'package:flutter_app/CRUD/matakuliah/datamatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title, this.image, this.color}) : super(key: key);
  final String image, title;
  final Color color;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  List<Dashboard> dashboard = [
    Dashboard(
        title: "Data Mahasiswa",
        image: "assets/images/student.png",
        color: Color(0xFF3D82AE)),
    Dashboard(
        title: "Data Dosen",
        image: "assets/images/teacher.png",
        color: Color(0xFFD3A984)),
    Dashboard(
        title: "Data Matakuliah",
        image: "assets/images/online-course.png",
        color: Color(0xFF989493)),
    Dashboard(
        title: "Data Jadwal",
        image: "assets/images/schedule.png",
        color: Color(0xFFE6B398)),
    Dashboard(
        title: "Data Karyawan",
        image: "assets/images/employee.png",
        color: Color(0xFFFB7883)),
    Dashboard(
      title: "Website UKDW",
      image: "assets/images/web-search-engine.png",
      color: Color(0xFFAEAEAE),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Brigita Monic"),
              accountEmail: Text("brigita.trisna@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  "BM",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              subtitle: Text("Data Dosen"),
              trailing: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataDosen(title: "Data Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              subtitle: Text("Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataMahasiswa(title: "Data Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              subtitle: Text("Data Matakuliah"),
              trailing: Icon(Icons.book_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataMatakuliah(title: "Data Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              subtitle: Text("Data Jadwal"),
              trailing: Icon(Icons.event_note_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDataJadwal(title: "Dashboard Jadwal"))
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
                  MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";