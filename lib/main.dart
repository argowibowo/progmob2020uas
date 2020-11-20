import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/home_view.dart';
import 'package:flutter_72180200/login_view.dart';
import 'package:flutter_72180200/pertemuan1.dart';
import 'package:flutter_72180200/splashscreen_view.dart';
import 'package:flutter_72180200/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //menghilangkan banner debug pada aplikasi
        title: 'Flutter Demo', //judul untuk recent app
        theme: ThemeData( // This is the theme of your application.
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: TugasPertemuan8(title: 'Tugas Pertemuan 1') //untuk mengubah mana yg dijalankan
        //home: MyHomePage(title: 'Flutter Demo Home Page')
        home: SplashScreenPage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  @override
  void initState() {
    //untuk tugas9 navigatelogin di komen dulu, soalnya lgsng ngarahin ke splashscreen
    //navigateLogin();
  }

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 0){
      //kalau sudah login islogin == 1, maka langsung diarahkan ke tugaspertemua8.dart & home_view (utk yg tgs 9)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Halo Push",)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "You have pushed the button this many times:"
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              color: Colors.blue,
              disabledColor: Colors.blue,
              child: Text(
                //'Pindah Halaman',
                'Login',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onPressed: () async { //fungsi runtime yg dipakai pd saat itu juga
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Halo Push",)),
                );*/
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Halo Push",)),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}