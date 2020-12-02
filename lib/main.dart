import 'package:flutter/material.dart';
import 'package:project_flutter_2020/dasboard.dart';
import 'package:project_flutter_2020/pertemuan08.dart';
import 'package:project_flutter_2020/pertemuan1.dart';
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: pertemuan1(title: 'Flutter Demo Home Page buatan sendiri'),
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
  void navigateLogin() async {
    SharePreferences pref = await SharePreferences.getInstance();
    int islogin = pref.getInt("is_LOGIN");
    if(islogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(title: "Hallo Push",)),
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
              'Hallo World Flutter 2020:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4
            ),
            RaisedButton(
              child: Text(
                'Login'
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_Login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard(title: "Hallo Push",)),
                );
              },
            )
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
