import 'package:flutter/material.dart';
import 'package:flutter_app/Jadwal/dashboard_jadwal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/dosen/dashboard_dosen.dart';
import 'package:flutter_app/mahasiswa/dashboard_mahasiswa.dart';
import 'package:flutter_app/Matakuliah/matakuliah.dart';


class Dashboardmain extends StatefulWidget {
  Dashboardmain({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _DashboardmainState createState() => _DashboardmainState();
}

class _DashboardmainState extends State<Dashboardmain> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Informasi Akademik"),
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nathanael Dennis S "),
              accountEmail: Text("nathanael.dennis@si.ukdw.ac.id"),
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: Text(
                  "NDS",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Menu Dosen",)),
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
                Icons.people_alt_outlined,
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
                Icons.library_books,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboardMatakuliah(title: "Menu Matakuliah",)),
                );
              },
            ),
            ListTile(
              title: Text("Jadwal"),
              subtitle: Text("Menu Jadwal"),
              trailing: Icon(
                Icons.schedule,
                color: Color(0xFF0D47A1),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Data Jadwal"))
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
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login(title: "Login Sistem Akademik",)),
                );
              },
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('image/tree1.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
            )
          ],

        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('image/tree.png')
                )
            ),
          ),
          Expanded(child:
          GridView.count(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 10 ,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('image/mahasiswa.png')
                          ),
                        ),
                      ),
                      FlatButton(onPressed: ()async {
                        Navigator.pushReplacement(
                          context,
                        MaterialPageRoute(builder: (context) => DashboardMahasiswa(title: "Data Mahasiswa",)),
                        );},
                          child: Text("Data Mahasiswa")),
                    ],
                  )
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('image/dosen.png')
                          ),
                        ),
                      ),
                      FlatButton(onPressed: ()async {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard_dosen(title: "Data Dosen",)),
                        );},
                          child: Text("Data Dosen")),

                    ],
                  )
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('image/matkul.png')
                          ),
                        ),
                      ),
                      FlatButton(onPressed: ()async {
                        Navigator.pushReplacement(
                          context,
                        MaterialPageRoute(builder: (context) => dashboardMatakuliah(title: "Data Matakuliah",)),
                        );},
                          child: Text("Data Matakuliah")),
                    ],
                  )
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('image/jadwal.png')
                          ),
                        ),
                      ),
                      FlatButton(onPressed: ()async {
                      //  SharedPreferences pref = await SharedPreferences.getInstance();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => DashboardJadwal(),));
                      },
                          child: Text("Data Jadwal")),
                    ],
                  )
              ),
            ],
          ),
          ),
        ],
      ),
    );

  }
}