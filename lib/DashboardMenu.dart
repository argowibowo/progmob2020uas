import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Mahasiswa/dashboardmhs.dart';
import 'package:flutter_app/Dosen/dashboarddsn.dart';
import 'package:flutter_app/Jadwal/dashboardjdwl.dart';
import 'package:flutter_app/Matakuliah/dashboardmkh.dart';
import 'package:flutter_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMenu extends StatefulWidget {
  @override
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
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
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: new Text("Dashboard Sistem Informasi"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: NetworkImage('')),
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
                              'https://scontent.fjog3-1.fna.fbcdn.net/v/t1.0-9/14224848_1174203735971998_3835474497327138949_n.jpg?_nc_cat=103&ccb=2&_nc_sid=174925&_nc_eui2=AeFv0kSUWQpqPotCfgRM-R3nxUyOYslZE03FTI5iyVkTTWdXwrtVIGu2PE19HRMMu7-zqff15S7l-hpPlJm90Gfx&_nc_ohc=Oet_IWQOrK4AX-A_HJB&_nc_ht=scontent.fjog3-1.fna&oh=2d09790d7f1a27d50bc37f595e0713a2&oe=60015B8A'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Yose Salawangi',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            Text(
                              '72180217',
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
                                  color: Colors.blue,
                                  child: Text(
                                      'Mahasiswa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahaisswa",)),
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
                                  color: Colors.blue,
                                  child: Text(
                                      'Dosen',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardDsn(title: "Dashboard Dosen",)),
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
                                  color: Colors.blue,
                                  child: Text(
                                      'Matakuliah',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardMkh(title: "Dashboard Matakuliah",)),
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
                                  color: Colors.blue,
                                  child: Text(
                                      'Jadwal',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: ()  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardJdwl(title:"Dashboard Jadwal",)),
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
                                  color: Colors.blue,
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
                                      MaterialPageRoute(builder: (context) => Login()),
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