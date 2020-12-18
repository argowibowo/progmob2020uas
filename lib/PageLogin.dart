import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/apiservices.dart';
import 'package:progmob_flutter_2020/bottomnavigation.dart';
import 'package:progmob_flutter_2020/dashboard.dart';
import 'package:progmob_flutter_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmob_flutter_2020/tugas8.dart';
import 'package:toast/toast.dart';



class PageLogin extends StatefulWidget {
  PageLogin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  String nimnik;
  String pass;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formState,
              child: Column(
                children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "NIK",
                hintText: "NIMNIK",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
              onSaved: (String value){
                this.nimnik = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
              onSaved: (String value){
                this.pass = value;
              },
            ),

            RaisedButton(
              child: Text(
                  'Login'
              ),
              onPressed: () async {
                _formState.currentState.save();
                ApiServices()
                .login(this.nimnik,this.pass)
                .then((isSuccess) {
                  if (isSuccess) {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>
                          Dashboard(title: 'Navigation',)),
                    );
                  } else {
                    Toast.show("username/password salah", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                  }
                });
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_logged", 1);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard(title: 'Tugas Akhir Semester',)
                  ),
                );
              },
            )
                ],
              ),
            )
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}