import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/components/constant.dart';
import 'package:progmob_flutter/dosen/dashboarddosen.dart';
import 'package:progmob_flutter/jadwal/dashboardjadwal.dart';
import 'package:progmob_flutter/login.dart';
import 'package:progmob_flutter/mahasiswa/dashboardmhs.dart';
import 'package:progmob_flutter/matakuliah/dashboardmatkul.dart';
import 'package:progmob_flutter/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  // Dashboard({Key key, this.title, this.username}) : super(key: key);
  // final String title;
  // final String username;
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  DashboardSI dashboard;

  @override
  void initState() {
    super.initState();
  }

  FutureOr onGoBack(dynamic value) {
    // Refresh state
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Apakah Anda yakin untuk logout?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () async {
                              SharedPreferences pref = await SharedPreferences.getInstance();
                              await pref.setInt("is_login", 0);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Login(title: "Login Page",)), (route)=>false
                              );
                            },
                            child: Text("Ya")
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Tidak")
                        )
                      ],
                    );
                  }
              );
              // SharedPreferences pref = await SharedPreferences.getInstance();
              // await pref.setInt("is_login", 0);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
              // );
            },
          )
        ],
      ),
      drawer: Drawer(
        // Pakai List karena bentuknya berupa list -> ke bawah
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Magdalena Evelyn Halim"),
                accountEmail: Text("magdalena.evelyn@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "ME",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Data Dosen"),
              subtitle: Text("Menu CRUD Data Dosen"),
              trailing: Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen"))
                );
              },
            ),
            ListTile(
              title: Text("Data Mahasiswa"),
              subtitle: Text("Menu CRUD Data Mahasiswa"),
              trailing: Icon(Icons.people_outline),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa"))
                );
              },
            ),
            ListTile(
              title: Text("Data Matakuliah"),
              subtitle: Text("Menu CRUD Data Matakuliah"),
              trailing: Icon(Icons.book_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => DashboardMatkul(title: "Dashboard Matakuliah"))
                );
              },
            ),
            ListTile(
              title: Text("Data Jadwal"),
              subtitle: Text("Menu CRUD Data Jadwal"),
              trailing: Icon(Icons.event_note_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal"))
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
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Logout"),
                        content: Text("Apakah Anda yakin untuk logout?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () async {
                                SharedPreferences pref = await SharedPreferences.getInstance();
                                await pref.setInt("is_login", 0);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login(title: "Login Page",)), (route)=>false
                                );
                              },
                              child: Text("Ya")
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tidak")
                          )
                        ],
                      );
                    }
                );
                // SharedPreferences pref = await SharedPreferences.getInstance();
                // await pref.setInt("is_login", 0);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
                // );
              },
              // onTap: () async {
              //   SharedPreferences pref = await SharedPreferences.getInstance();
              //   await pref.setInt("is_login", 0);
              //   Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(builder: (context) => Login(title: "Login Page",)),
              //   );
              // },
            ),
          ],
        ),
      ),

      // body: Container(
        // child: Center(
        //   child: Text("Dashboard",
        //     style: TextStyle(fontSize: 20),
        //   ),
        // ),
      //   color:Color(0xffE5E5E5),
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            // Ga ada method getnya :(
            // Text("Hey " + widget.username, style: kHeadingextStyle,),
            Text("Welcome Back", style: kHeadingextStyle,),
            Text("Selamat datang di KRS UKDW", style: kSubheadingextStyle,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("images/Conference-amico.png"),
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Data Dosen",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      FutureBuilder<DashboardSI>(
                        future: ApiServices().getDashboard(),
                        builder: (BuildContext context, AsyncSnapshot<DashboardSI> snapshot) {
                          if(snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data.dosen,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 70.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          return Center(
                            child: Text(
                              "Mohon Bersabar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("images/Bibliophile-rafiki.png"),
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                      children: <Widget>[
                        Text(
                          "Data Mahasiswa",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        FutureBuilder<DashboardSI>(
                          future: ApiServices().getDashboard(),
                          builder: (BuildContext context, AsyncSnapshot<DashboardSI> snapshot) {
                            if(snapshot.hasData){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.mahasiswa,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 70.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return Center(
                              child: Text(
                                "Mohon Bersabar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  ),
                  ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("images/Nerd-amico.png"),
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                      children: <Widget>[
                        Text(
                          "Data Matakuliah",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        FutureBuilder<DashboardSI>(
                          future: ApiServices().getDashboard(),
                          builder: (BuildContext context, AsyncSnapshot<DashboardSI> snapshot) {
                            if(snapshot.hasData){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.matakuliah,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 70.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return Center(
                              child: Text(
                                "Mohon Bersabar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("images/Calendar-cuate.png"),
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                      children: <Widget>[
                        Text(
                          "Data Jadwal",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        FutureBuilder<DashboardSI>(
                          future: ApiServices().getDashboard(),
                          builder: (BuildContext context, AsyncSnapshot<DashboardSI> snapshot) {
                            if(snapshot.hasData){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.jadwal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 70.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return Center(
                              child: Text(
                                "Mohon Bersabar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}