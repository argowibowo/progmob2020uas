import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_setelah_uts_72180190/dosen/dashboarddosen.dart';
import 'package:progmob_setelah_uts_72180190/jadwal/dashboardjadwal.dart';
import 'package:progmob_setelah_uts_72180190/loginpage.dart';
import 'package:progmob_setelah_uts_72180190/mahasiswa/dashboardmhs.dart';
import 'package:progmob_setelah_uts_72180190/matakuliah/dashboardmatakuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';

import 'apiservices.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 7.5,
        color: Colors.cyan,
        fontWeight: FontWeight.bold);


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/top_header.png'))),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                  height: 64,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/profile_images/740076423348510720/6o-ZBbCd_400x400.jpg'),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Argo Wibowo, S.T., MT',
                            style: TextStyle(
                                fontFamily: 'Montserrat Medium',
                                color: Colors.white,
                                fontSize: 14),
                          ),
                          Text(
                            'argo@staff.ukdw.ac.id',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Montserrat Regular'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.logout, color: Colors.white),
                        onPressed: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          await pref.setInt("is_login", 0);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Loginpage(title: "Login")));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      primary: false,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.network(
                                  'https://www.flaticon.com/svg/static/icons/svg/3135/3135755.svg',
                                  height: 50,
                                ),
                                Text(
                                  'Data Mahasiswa',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardMahasiswa(
                                          title: "Dashboard Mahasiswa")),).then(onGoBack);
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.network(
                                  'https://www.flaticon.com/svg/static/icons/svg/991/991848.svg',
                                  height: 50,
                                ),
                                Text(
                                  'Data Dosen',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardDosen(
                                          title: "Dashboard Dosen")),).then(onGoBack);
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.network(
                                  'https://www.flaticon.com/svg/static/icons/svg/2000/2000860.svg',
                                  height: 50,
                                ),
                                Text(
                                  'Data Matakuliah',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardMatakuliah(
                                          title: "Dashboard Matakuliah")),).then(onGoBack);
                            },
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.network(
                                  'https://www.flaticon.com/svg/static/icons/svg/584/584547.svg',
                                  height: 50,
                                ),
                                Text(
                                  'Data Jadwal',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardJadwal(
                                          title: "Dashboard Jadwal")),).then(onGoBack);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      primary: false,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.network(
                                'https://www.flaticon.com/svg/static/icons/svg/3523/3523407.svg',
                                height: 70,
                              ),
                              Text(
                                'Data Mahasiswa',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              FutureBuilder<DashboardSI>(
                                  future: ApiServices().getDashboard(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DashboardSI> snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(.0),
                                        child: Text(
                                          "Jumlah Data: " +
                                              snapshot.data.mahasiswa,
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Text(
                                        //"${snapshot.error.toString()}",
                                        "Load Data",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.network(
                                'https://www.flaticon.com/svg/static/icons/svg/2972/2972264.svg',
                                height: 70,
                              ),
                              Text(
                                'Data Dosen',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              FutureBuilder<DashboardSI>(
                                  future: ApiServices().getDashboard(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DashboardSI> snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(.0),
                                        child: Text(
                                          "Jumlah Data: " + snapshot.data.dosen,
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Text(
                                        //"${snapshot.error.toString()}",
                                        "Load Data",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.network(
                                'https://www.flaticon.com/svg/static/icons/svg/2963/2963156.svg',
                                height: 70,
                              ),
                              Text(
                                'Data Matakuliah',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              FutureBuilder<DashboardSI>(
                                  future: ApiServices().getDashboard(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DashboardSI> snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(.0),
                                        child: Text(
                                          "Jumlah Data: " +
                                              snapshot.data.matakuliah,
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Text(
                                        //"${snapshot.error.toString()}",
                                        "Load Data",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.network(
                                'https://www.flaticon.com/svg/static/icons/svg/3269/3269691.svg',
                                height: 70,
                              ),
                              Text(
                                'Data Jadwal',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              FutureBuilder<DashboardSI>(
                                  future: ApiServices().getDashboard(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DashboardSI> snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(.0),
                                        child: Text(
                                          "Jumlah Data: " +
                                              snapshot.data.jadwal,
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Text(
                                        //"${snapshot.error.toString()}",
                                        "Load Data",
                                        style: TextStyle(
                                          color: Color(0xFF0D47A1),
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
