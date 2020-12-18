import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'dart:async';
import 'dart:ui';
import 'package:progmob_flutter/dosen/dashboardDosen.dart';
import 'package:progmob_flutter/jadwal/dashboardJadwal.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMahasiswa.dart';
import 'package:progmob_flutter/main.dart';
import 'package:progmob_flutter/matakuliah/dashboardMatakuliah.dart';
import 'package:progmob_flutter/splashLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:progmob_flutter/model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();

  FutureOr onGoBack(dynamic value) {
    //ketika udah insert data, navigate ke halaman baru, klo goback akan refresh data barunya
    setState(() {}); //refresh
  }

  //DASHBOARD - LOGO BAGIAN ATAS
  //untuk dashboard yang bagian nampilin logo
  Material logoDashboard(Image img) {
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        "assets/logo_progmob2020.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Material tulisanWelcome(String heading){
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      shadowColor: Colors.deepPurple[50],
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          heading,
                          style: TextStyle(
                            color: Colors.blueGrey[50],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //MENU MAHASISWA
  //untuk dashboard bagian menu2 data mhs,dosen,matkul,jadwal
  Material myItemsMhs(IconData icon, String heading, Future<DashboardSI> mahasiswa, int color){
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      shadowColor: Colors.deepPurple[50],
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Colors.blueGrey[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  FutureBuilder<DashboardSI>(
                    future: ApiServices().getDashboard(),
                    builder: (BuildContext context, AsyncSnapshot<DashboardSI> snapshot) {
                      if(snapshot.hasData){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Jumlah : " + snapshot.data.mahasiswa,
                            style: TextStyle(
                              color: Colors.blueGrey[50],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          //"${snapshot.error.toString()}",
                          "Wait...",
                          style: TextStyle(
                            color: Colors.blueGrey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //MENU DOSEN
  //untuk dashboard bagian menu2 data mhs,dosen,matkul,jadwal
  Material myItemsDsn(
      IconData icon, String heading, Future<DashboardSI> dosen, int color) {
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      shadowColor: Colors.deepPurple[50],
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Colors.blueGrey[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.blueGrey[50],
                        size: 30.0,
                      ),
                    ),
                  ),
                  FutureBuilder<DashboardSI>(
                    future: ApiServices().getDashboard(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DashboardSI> snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Jumlah : " + snapshot.data.dosen,
                            style: TextStyle(
                              color: Colors.blueGrey[50],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          //"${snapshot.error.toString()}",
                          "Wait...",
                          style: TextStyle(
                            color: Colors.blueGrey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //MENU MATAKULIAH
  //untuk dashboard bagian menu2 data mhs,dosen,matkul,jadwal
  Material myItemsMatkul(
      IconData icon, String heading, Future<DashboardSI> matkul, int color) {
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      shadowColor: Colors.deepPurple[50],
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Colors.blueGrey[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.blueGrey[50],
                        size: 30.0,
                      ),
                    ),
                  ),
                  FutureBuilder<DashboardSI>(
                    future: ApiServices().getDashboard(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DashboardSI> snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Jumlah : " + snapshot.data.matakuliah,
                            style: TextStyle(
                              color: Colors.blueGrey[50],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          //"${snapshot.error.toString()}",
                          "Wait...",
                          style: TextStyle(
                            color: Colors.blueGrey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //MENU JADWAL
  //untuk dashboard bagian menu2 data mhs,dosen,matkul,jadwal
  Material myItemsJadwal(
      IconData icon, String heading, Future<DashboardSI> jadwal, int color) {
    return Material(
      color: Colors.deepPurpleAccent[100],
      elevation: 4.0,
      shadowColor: Colors.deepPurple[50],
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Colors.blueGrey[50],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.blueGrey[50],
                        size: 30.0,
                      ),
                    ),
                  ),
                  FutureBuilder<DashboardSI>(
                    future: ApiServices().getDashboard(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DashboardSI> snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Jumlah : " + snapshot.data.jadwal,
                            style: TextStyle(
                              color: Colors.blueGrey[50],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          //"${snapshot.error.toString()}",
                          "Wait...",
                          style: TextStyle(
                            color: Colors.blueGrey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurpleAccent[100],
        actions: <Widget>[
          GestureDetector(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    //logout dgn sharedpreferences
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("isLogin", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplashLogin(
                            title: "Login",
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Elbie Reyova Evendi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
              accountEmail: Text("elbie.reyova@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Colors.deepPurple[900],
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/user_foto.jpg"),
              ),
            ),
            ListTile(
              title: Text(
                "Data Dosen",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.people,
                color: Colors.deepPurple[900],
              ),
              subtitle: Text(
                "Menu CRUD Data Dosen",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //pindah ke dashboard dosen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardDosen(
                            title: "Menu Dosen",
                          )),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Mahasiswa",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.person_outline,
                color: Colors.deepPurple[900],
              ),
              subtitle: Text(
                "Menu CRUD Data Mahasiswa",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //pindah ke dashboard mahasiswa
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardMahasiswa(
                            title: "Menu Mahasiswa",
                          )),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Matakuliah",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.library_books_rounded,
                color: Colors.deepPurple[900],
              ),
              subtitle: Text(
                "Menu CRUD Data Matakuliah",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //pindah ke dashboard matakuliah
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardMatakuliah(
                            title: "Menu Matakuliah",
                          )),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Jadwal",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.schedule,
                color: Colors.deepPurple[900],
              ),
              subtitle: Text(
                "Menu CRUD Data Jadwal",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //pindah ke dashboard jadwal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardJadwal(
                            title: "Menu Jadwal",
                          )),
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
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Colors.deepPurple[900],
              ),
              onTap: () async {
                //logout dgn sharedpreferences
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("isLogin", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SplashLogin(
                            title: "Login",
                          )),
                );
              },
            ),
          ],
        ),
      ),
/*Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer:Drawer(
        child: ListView(
            children:<Widget>[
             UserAccountsDrawerHeader(
                 accountName: Text("Elbie Reyova"),
                 accountEmail: Text("elbie.reyova@si.ukdw.ac.id"),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Colors.white,
                   child: Text(
                     "ER",
                     style: TextStyle(fontSize: 40.0),
                   ),
                 )
             ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title:"Dashboard Dosen")));
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outlined),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMahasiswa(title:"Dashboard Mahasiswa")));
                },
              ),
              ListTile(
                title: Text("Data Matakuliah"),
                trailing: Icon(Icons.article),
                subtitle: Text("Menu CRUD Matakuliah"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMatakuliah(title:"Dashboard Matakuliah")));
                },
              ),
              ListTile(
                title: Text("Data Jadwal"),
                trailing: Icon(Icons.schedule),
                subtitle: Text("Menu CRUD Jadwal"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardJadwal(title:"Dashboard Jadwal")));
                },
              ),
              //MEMBUAT PEMISAH
              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("isLogin", 0);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashLogin(title: "Halo Push",)));
                },
              ),
            ]
        ),
      ),*/
      //LATIHAN COBA DASHBOARD
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          logoDashboard(Image.asset("images/logo_progmob2020.png")),
          tulisanWelcome("Welcome to Progmob 2020"),
          myItemsMhs(Icons.person_outline_rounded, "Mahasiswa",
              ApiServices().getDashboard(), 0xFF64B5F6),
          myItemsDsn(Icons.people_outline, "Dosen",
              ApiServices().getDashboard(), 0xFF90CAF9),
          myItemsMatkul(Icons.my_library_books_outlined, "Matakuliah",
              ApiServices().getDashboard(), 0xFFBBDEFB),
          myItemsJadwal(Icons.schedule_outlined, "Jadwal",
              ApiServices().getDashboard(), 0xFFE3F3FD),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 220),
          StaggeredTile.extent(2, 75),
          StaggeredTile.extent(1, 170),
          StaggeredTile.extent(1, 170),
          StaggeredTile.extent(1, 170),
          StaggeredTile.extent(1, 170),
        ],
      ),
    );
  }
}
