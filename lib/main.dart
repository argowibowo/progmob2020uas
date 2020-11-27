import 'package:flutter/material.dart';
//import 'package:flutter_72180247/pertemuan 1/pertemuan1.dart';
import 'package:flutter_72180247/Tugaspertemuan8.dart';
import 'package:flutter_72180247/pertemuan 2/splash.dart';
import 'package:flutter_72180247/pertemuan 2/pertemuan2.dart';
import 'package:flutter_72180247/pertemuan%202/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    //MyApp diganti MaterialApp
    debugShowCheckedModeBanner: false,
    // title: 'DUTA TANI',
    home: Splash(),
    routes: <String, WidgetBuilder>{
      '/LoginPage': (BuildContext context) => new LoginPage()
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROGMOB!?!?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
          debugShowCheckedModeBanner: false,
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

  // void navigateLogin() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int isLogin = pref.get("is_login");
  //   if(isLogin == 1){
  //     Navigator.pushReplacement(context,
  //     MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halo Push",)),
  //     );
  //   }
  // }
  //
  // @override
  // void initState(){
  //   navigateLogin();
  // }

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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text(
                'Login'
              ),
              onPressed: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halo Push",)),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
      ),
    );
  }
}
