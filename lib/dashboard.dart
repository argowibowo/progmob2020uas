import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob/UAS/Login.dart';
import 'package:flutter_progmob/UAS/Dosen/dshbrddos.dart';
import 'package:flutter_progmob/UAS/Jadwal/dshbrdjdwl.dart';
import 'package:flutter_progmob/UAS/Mahasiswa/dshbrdmhs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_progmob/UAS/Matakuliah/dshbrdmtk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'UAS/API/model.dart';
import 'UAS/GridDashboard.dart';



class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String _baseUrl = "https://argouchiha.000webhostapp.com";
  Client client = Client();
  String mhs;
  String dos;
  String mtk;
  String jdw;
  //List<dynamic> _datados = new List();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void getDos() async {
    final response = await client.get(_baseUrl + "/api/progmob/dashboard/72180186");
    var listDatados = jsonDecode(response.body);
    String mhs = listDatados['mahasiswa'];
    String dos = listDatados['dosen'];
    String mtk = listDatados['matakuliah'];
    String jdw = listDatados['jadwal'];
    setState(() {

    });
    this.mhs=mhs;
    this.dos=dos;
    this.mtk=mtk;
    this.jdw=jdw;

  }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getDos();
    }

  FutureOr onGoBack(dynamic value){
    setState(() {});
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
                  accountName: Text("Adrian Stefano and"),
                  accountEmail: Text("adrianstefano@mail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "AS",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Data Dosen"),
                  trailing: Icon(Icons.people),
                  subtitle: Text("Menu CRUD Data Dosen"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboardDos(title: "Data Dosen",))
                    ).then(onGoBack);
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
                        MaterialPageRoute(builder: (context) =>
                            DashboardMhs(title: "Data Mahasiswa",))
                    ).then(onGoBack);
                  },
                ),
                ListTile(
                  title: Text("Data Matakuliah"),
                  trailing: Icon(Icons.library_books),
                  subtitle: Text("Menu CRUD Data Mahasiswa"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboardMtk(title: "Data Matakuliah",))
                    ).then(onGoBack);
                  },
                ),
                ListTile(
                  title: Text("Data Jadwal"),
                  trailing: Icon(Icons.calendar_today_outlined),
                  subtitle: Text("Menu CRUD Data Mahasiswa"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            DashboardJdwl(title: "Data Jadwal",))
                    ).then(onGoBack);
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
                  subtitle: Text("Menu CRUD Data Mahasiswa"),
                  onTap: () async {
                    SharedPreferences pref = await SharedPreferences
                        .getInstance();
                    await pref.setInt("is_logged", 0);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(title: "wow",))
                    );
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey,
          body: Column(children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" HOME DASHBOARD ", style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          )
                      ),),
                      SizedBox(height: 4,),
                      Text("Home", style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          )
                      ),)
                    ],
                  ),
                  IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.notification_important),
                      iconSize: 24,
                      color: Colors.yellow,
                      onPressed: null
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GridDashboard(mhs,dos,mtk,jdw)

          ],)
      );
    }
  }
