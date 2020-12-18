import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kerenkezia/Dosen/dashboarddosen.dart';
import 'package:flutter_kerenkezia/Jadwal/dashboardjadwal.dart';
import 'package:flutter_kerenkezia/Mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_kerenkezia/Matakuliah/dashboardmatkul.dart';
import 'package:flutter_kerenkezia/login.dart';
import 'package:flutter_kerenkezia/pertemuan1.dart';
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
                              'https://scontent.fjog3-1.fna.fbcdn.net/v/t1.0-9/131931380_3842496259147022_622389775352559038_o.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeEB9_cdY-KOkU_7e0ZYKLkmkYj7YhpJj-uRiPtiGkmP6-J1EPBSuVSggGwnpw2xqmv8PZOyG0DV4Hw4FlFuDncI&_nc_ohc=jWkCDA-xjFEAX-1os79&_nc_ht=scontent.fjog3-1.fna&oh=e87ea0d481a195f376aea52b8cb0a537&oe=600122D6'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'KEREN KEZIA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              '72180222',
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