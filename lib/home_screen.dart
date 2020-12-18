import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Dosen/dashboarddosen.dart';
import 'package:flutter_app/Jadwal/dashboardjadwal.dart';
import 'package:flutter_app/Mahasiswa/dashboardmahasiswa.dart';
import 'package:flutter_app/Matakuliah/dashboardmatakuliah.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/main.dart';
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
      appBar: AppBar(
        title: Text("Tugas 11"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login_outlined,size: 35.0,),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt('is_login', 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "UAS PROGMOB",)),
                );
              }
          )
        ],
      ),
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
                              'https://scontent.fjog3-1.fna.fbcdn.net/v/t1.0-9/79881200_2301411990150202_8768215695159721984_n.jpg?_nc_cat=109&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeGVqgTyLd9s4j4UgDbcEUv1HtnBmeNJcroe2cGZ40lyunSqS4mrpW5I8-JxJMwvXw5xTnVn00URTGt6DmTUlMxj&_nc_ohc=XbW9L5Y7y5wAX-fZNaO&_nc_ht=scontent.fjog3-1.fna&oh=184415bc585d1c53ca08960a92533849&oe=6002DEDC'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Bhenedicto Adriel Natalawa P',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              '72180225',
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
                                  color: Colors.deepPurple,
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
                                      MaterialPageRoute(builder: (context) => Mahasiswadb(title: "UAS PROGMOB",)),
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
                                  color: Colors.deepPurple,
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
                                      MaterialPageRoute(builder: (context) => Dosendb(title: "UAS PROGMOB",)),
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
                                  color: Colors.deepPurple,
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
                                      MaterialPageRoute(builder: (context) => Matakuliahdb(title: "UAS PROGMOB",)),
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
                                  color: Colors.deepPurple,
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
                                      MaterialPageRoute(builder: (context) => Jadwaldb(title: "UAS PROGMOB",)),
                                    );
                                  }
                              ),

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
