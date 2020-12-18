import 'package:fluter_hello_world/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluter_hello_world/dosen/DashboardDosen.dart';
import 'package:fluter_hello_world/jadwal/DashboardJadwal.dart';
import 'package:fluter_hello_world/mahasiswa/DashboardMahasiswa.dart';
import 'package:fluter_hello_world/matakuliah/DashboardMatakuliah.dart';
import 'package:fluter_hello_world/dashboard.dart';
import 'package:fluter_hello_world/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
              //       begin: Alignment.topCenter, end: Alignment.bottomCenter),
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: NetworkImage('https://www.jagoanhosting.com/wp-content/uploads/2017/10/bg-top-header.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                              'https://www.instagram.com/p/CDUXiiJhXHQ/?utm_source=ig_web_copy_link'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Alfina Febri P',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              '72180188',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(

                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  color: Colors.brown,
                                  child: Text(
                                      'MAHASISWA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "DATA MAHASISWA",)),
                                    );
                                  }
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  color: Colors.brown,
                                  child: Text(
                                      'DOSEN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardDosen(title: "DATA DOSEN",)),
                                    );
                                  }
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  color: Colors.brown,
                                  child: Text(
                                      'MATAKULIAH',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "DATA MATAKULIAH",)),
                                    );
                                  }
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  color: Colors.brown,
                                  child: Text(
                                      'JADWAL',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardJadwal(title: "DATA JADWAL",)),
                                    );
                                  }
                              ),

                            ],
                          ),
                        ),

                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  color: Colors.brown,
                                  child: Text(
                                      'LOGOUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setInt('is_login', 0);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login(title: "UAS PROGMOB",)),
                                    );
                                  }
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }
}