import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/apiservices.dart';
import 'package:flutter_72180200/dosen/dashboard_dosen.dart';
import 'package:flutter_72180200/jadwal/dashboard_jadwal.dart';
import 'package:flutter_72180200/login_view.dart';
import 'package:flutter_72180200/mahasiswa/dashboard_mahasiswa.dart';
import 'package:flutter_72180200/matakuliah/dashboard_matakuliah.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  final String title;
  LoginProgmob login;

  HomePage({Key key, @required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(title);
}

class _HomePageState extends State<HomePage>{
  final _formKey = GlobalKey<FormState>();
  final String title;
  //LoginProgmob login;
  bool _isLoading = false;

  _HomePageState(this.title);

  FutureOr onGoBack(dynamic value){ //ketika udah insert data, navigate ke halaman baru, klo goback akan refresh data barunya
    setState(() {}); //refresh
  }

  //ALERT TOMBOL LOGOUT
  _displayDialogLogout(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 2,
            title: Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              "Anda yakin mau keluar?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D47A1),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login_progmob", 0);
                  /*Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login(title: "Login",)),
                  );*/
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login(title: "Login",)), (route) => false);
                },
                child: Text(
                  "Ya",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "Tidak",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          );
        });
  }

  //DASHBOARD - LOGO BAGIAN ATAS
  //untuk dashboard yang bagian nampilin logo
  Material logoDashboard(Image img){
    return Material(
      color: Color(0xFF2196F3),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF81D4FA),
              ],
            ),
            //color: Color(0xFF0D47A1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
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
                        "images/logo_univ.png",
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
      color: Color(0xFF42A5F5),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF1565C0),
                Color(0xFF81D4FA),
              ],
            ),
            //color: Color(0xFF0D47A1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
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
/*                      Image.asset(
                        "images/logo_toga.png",
                        width: 40,
                        height: 40,
                      ),*/
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          heading,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /*Image.asset(
                        "images/logo_toga.png",
                        width: 40,
                        height: 40,
                      ),*/
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
      color: Color(color),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            /*gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF1565C0),
                Color(0xFF81D4FA),
              ],
            ),*/
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Material(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      "images/logo_mhs.png",
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
                              color: Color(0xFF0D47A1),
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
                            color: Color(0xFF0D47A1),
                            //fontWeight: FontWeight.bold,
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
  Material myItemsDsn(IconData icon, String heading, Future<DashboardSI> dosen, int color){
    return Material(
      color: Color(color),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            /*gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xFF1565C0),
                Color(0xFF81D4FA),
              ],
            ),*/
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Material(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      "images/logo_dosen.png",
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
                            "Jumlah : " + snapshot.data.dosen,
                            style: TextStyle(
                              color: Color(0xFF0D47A1),
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
                            color: Color(0xFF0D47A1),
                            //fontWeight: FontWeight.bold,
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
  Material myItemsMatkul(IconData icon, String heading, Future<DashboardSI> matkul, int color){
    return Material(
      color: Color(color),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            /*gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Color(0xFF1565C0),
                Color(0xFF81D4FA),
              ],
            ),*/
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Material(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      "images/logo_matkul.png",
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
                            "Jumlah : " + snapshot.data.matakuliah,
                            style: TextStyle(
                              color: Color(0xFF0D47A1),
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
                            color: Color(0xFF0D47A1),
                            //: FontWeight.bold,
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
  Material myItemsJadwal(IconData icon, String heading, Future<DashboardSI> jadwal, int color){
    return Material(
      color: Color(color),
      elevation: 4.0,
      shadowColor: Color(0xFF1565C0),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            /*gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: <Color>[
                Color(0xFF1565C0),
                Color(0xFF81D4FA),
              ],
            ),*/
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Material(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      "images/logo_jadwal.png",
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
                            "Jumlah : " + snapshot.data.jadwal,
                            style: TextStyle(
                              color: Color(0xFF0D47A1),
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
                            color: Color(0xFF0D47A1),
                            //fontWeight: FontWeight.bold,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF0D47A1),
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
/*              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login_progmob", 0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login(title: "Login",)),
              );*/
              _displayDialogLogout(context);
            },
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
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
              accountName: Text(
                  "Administrator KRS",
                  /*this.login.nama,*/
              ),
              accountEmail: Text(
                  "admin@staff.ukdw.ac.id",
                  /*this.login.email,*/
              ),
              decoration: BoxDecoration(
                //color: Color(0xFF0D47A1),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF81D4FA),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFE8EAF6),
                child: Text(
                  "AK",
                  style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 40
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Data Dosen",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.people,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Dosen",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                //pindah ke dashboard dosen
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosen(title: "Menu Dosen",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Mahasiswa",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.person_outline,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Mahasiswa",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                //pindah ke dashboard mahasiswa
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
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.library_books_rounded,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Matakuliah",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                //pindah ke dashboard matakuliah
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Menu Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text(
                "Data Jadwal",
                style: TextStyle(
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.schedule,
                color: Color(0xFF0D47A1),
              ),
              subtitle: Text(
                "Menu CRUD Data Jadwal",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                //pindah ke dashboard jadwal
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Menu Jadwal",)),
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
                  color: Color(0xFF0D47A1),
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Color(0xFF0D47A1),
              ),
              onTap: () async{
                //logout dgn sharedpreferences
/*                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login_progmob", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login",)),
                );*/
                _displayDialogLogout(context);
              },
            ),
          ],
        ),
      ),
      //TAMPILAN BIASA SEBELUM ADA DASHBOARD
      /*body: Center(
        child: Form(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,15),
                  child: Image.asset(
                    "images/logo_progmob.png",
                    width: 300,
                    height: 300,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,5),
                  child: Text(
                    'Welcome to Progmob 2020!',
                    style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 20
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10)
                ),
                RaisedButton(
                  color: Color(0xFF0D47A1),
                  disabledColor: Color(0xFF0D47A1),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login_progmob", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login(title: "Login",)),
                    );
                  },
                )
              ]
          ),
        ),
      ),*/

      //LATIHAN COBA DASHBOARD
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        children: <Widget>[
          logoDashboard(Image.asset("images/logo_progmob.png")),
          tulisanWelcome("Welcome to Progmob 2020"),
          myItemsMhs(Icons.person_outline_rounded, "Data Mahasiswa", ApiServices().getDashboard(), 0xFFE3F3FD),
          myItemsDsn(Icons.people_outline, "Data Dosen", ApiServices().getDashboard(), 0xFFE3F3FD),
          myItemsMatkul(Icons.my_library_books_outlined, "Data Matakuliah", ApiServices().getDashboard(), 0xFFE3F3FD),
          myItemsJadwal(Icons.schedule_outlined, "Data Jadwal", ApiServices().getDashboard(), 0xFFE3F3FD),
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