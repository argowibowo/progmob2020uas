import 'package:flutter/material.dart';
import 'package:progmob_flutter/dosen/dashboardDosen.dart';
import 'package:progmob_flutter/mahasiswa/dashboardMahasiswa.dart';
import 'package:progmob_flutter/main.dart';
import 'package:progmob_flutter/splashLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Dashboard extends StatefulWidget{
  Dashboard({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _DashboardState createState()=> _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  int _counter = 2;

  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
      ),
      drawer:Drawer(
        child: ListView(
            children:<Widget>[
             UserAccountsDrawerHeader(
                 accountName: Text("Elbie Reyova"),
                 accountEmail: Text("elbie.reyova@si.ukdw.ac.id"),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Colors.white,
                   child: Text(
                     "ER",
                     style: TextStyle(fontSize: 40.0),
                   ),
                 )
             ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardDosen(title:"Dashboard Dosen")));
                },
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people_outlined),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardMahasiswa(title:"Dashboard Mahasiswa")));
                },
              ),
              //MEMBUAT PEMISAH
              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("isLogin", 0);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashLogin(title: "Halo Push",)));
                },
              ),
            ]
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child : Icon(Icons.add),
      ),*/
    );
  }
}
