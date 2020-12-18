import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/tugaspertemuan9.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.deepPurple
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
      ),
      home: MyHomePage(title: "Progmob 2020",),
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
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final nimnikController = TextEditingController();
  final passwordController = TextEditingController();
  String username, password;
  // int _counter = 0;

  @override
  void dispose(){
    nimnikController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  Void Validate(){
    if (key.currentState.validate()){
      print("Validate");
    }
    else {
      print("failed");
    }
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  void navigateLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isLogin = prefs.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              TextFormField(
                controller: nimnikController..text="72160000",
                validator: (value){
                  if(value.isEmpty && value.length == 0) {
                    return "Username tidak boleh kosong";
                  } else if (!value.contains('72160000')){
                    return "Username atau password";
                  } else
                    return null;
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Username",
                    hintText: "Masukkan Username",
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10)
                    )
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 20,
              ),
              TextFormField(
                controller: passwordController..text="progmob",
                obscureText: true,
                validator: (value){
                  if(value.isEmpty && value.length == 0) {
                    return "Password tidak boleh kosong";
                  } else if (!value.contains('progmob')){
                    return "Username atau password";
                  } else
                    return null;
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.lock),

                    labelText: "Password",
                    hintText: "Masukkan Password",
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10)
                    )
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 20,
              ),
              RaisedButton(
                  color: Colors.black,
                  child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )
                  ),

                  onPressed: ()  async {
                    if(key.currentState.validate()){
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setInt('is_login', 1);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                    }

              )

            ],
          ),
        ),
      ),
      );

  }
}