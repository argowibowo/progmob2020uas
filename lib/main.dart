import 'package:flutter/material.dart';
import 'package:flutter_app_progmob2020/Pertemuan1.dart';
import 'package:flutter_app_progmob2020/TugasPertemuan8.dart';
import 'package:flutter_app_progmob2020/TugasPertemuan9/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_Login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Hallo push",)),
      );
    }
  }

  @override
  void initState() {
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat Datang',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text(
                  'Pindah halaman'
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Hallo push",)),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}