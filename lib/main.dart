// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:flutterku72160025/pertemuan2.dart';
import 'package:flutterku72160025/splashscreen.dart';
import 'package:flutterku72160025/pertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Dunia Tipu Tipu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Tugas Hello World
      // home: MyHomePage(title: "Flutter"),
      // Video Pertemuan 8
      // home: Pertemuan1(title: "Home Page"),
      // Tugas Pertemuan 8
      // home: TugasPertemuan8(title: "Pertemuan 1"),
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

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halo ini Pertemuan 2 ku",)),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello World",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          
            RaisedButton(
              child: Text(
                'Login'
              ),
                onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                // login = 1; logout = 0
                await pref.setInt("is_login", 1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Pertemuan8(title: "Halo ini pertemuan 8 ku",)),
                  );
                }
            )
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