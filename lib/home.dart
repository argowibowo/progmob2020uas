import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob2020/dosen/dashboarddosen.dart';
import 'package:flutter_progmob2020/Jadwal/dashboardjadwal.dart';
import 'package:flutter_progmob2020/Mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_progmob2020/Matakuliah/dashboardmatkul.dart';
import 'package:flutter_progmob2020/login.dart';
import 'package:flutter_progmob2020/pertemuan1.dart';
// import 'package:flutter_app/Jadwal/dashboardjadwal.dart';
// import 'package:flutter_app/Mahasiswa/dashboardmahasiswa.dart';
// import 'package:flutter_app/Matakuliah/dashboardmatakuliah.dart';
// import 'package:flutter_app/dashboard.dart';
// import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences sharedPreferences;

  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }
  //
  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if(sharedPreferences.getString("token") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
  //   }
  // }
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
                  image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FTThxRo_baground-gambar-background-keren%2F&psig=AOvVaw17olkQajOUm4vSiB1roeU5&ust=1608443240677000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjGhpOs2e0CFQAAAAAdAAAAABAI')),
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
                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ilmubahasa.net%2F2018%2F10%2Fbackground-keren.html&psig=AOvVaw17olkQajOUm4vSiB1roeU5&ust=1608443240677000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjGhpOs2e0CFQAAAAAdAAAAABAD'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Kurniadi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              '72170163',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
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
                                  color: Colors.pinkAccent,
                                  child: Text(
                                      'MAHASISWA',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "PROGMOB 2020",)),
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
                                  color: Colors.pinkAccent,
                                  child: Text(
                                      'DOSEN',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardDosen(title: "PROGMOB 2020",)),
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
                                  color: Colors.pinkAccent,
                                  child: Text(
                                      'MATAKULIAH',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => dashboardmatkul(title: "UAS PROGMOB",)),
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
                                  color: Colors.pinkAccent,
                                  child: Text(
                                      'JADWAL',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => dashboardjadwal(title: "PROGMOB 2020",)),
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
                                  color: Colors.pinkAccent,
                                  child: Text(
                                      'LOGOUT',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setInt('is_login', 0);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login(title: "PROGMOB 2020",)),
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