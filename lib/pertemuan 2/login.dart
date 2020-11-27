import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180247/Tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool checkValue = false;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFB2EBF2),
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white12,
      ),
      body: new SingleChildScrollView(
        child: _body(),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget _body() {
    return new Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                children: [
                  Image.asset(
                    "images/logo_splash.png",
                    width: 200.0,
                    height: 200.0,
                  ),
                  Text("PROGMOB!?!?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ))
                ]
            ),
          ),
          new TextField(
            controller: username,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.people),
                hintText: "Username",
                hintStyle: new TextStyle(color: Colors.grey.withOpacity(0.3))),
          ),
          new TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "Password",
                  hintStyle:
                  new TextStyle(color: Colors.grey.withOpacity(0.3)))),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          new CheckboxListTile(
            value: checkValue,
            onChanged: _onChanged,
            title: new Text("Remember me"),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          new Container(
            decoration:
            new BoxDecoration(border: Border.all(color: Colors.white), color: Colors.lightBlue),
            child: new ListTile(
              title: new Text(
                "LOGIN",
                textAlign: TextAlign.center,
              ),
              onTap: _navigator,
            ),
          )
        ],
      ),
    );
  }

  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", username.text);
      sharedPreferences.setString("password", password.text);
      sharedPreferences.commit();
      getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          username.text = sharedPreferences.getString("username");
          password.text = sharedPreferences.getString("password");
        } else {
          username.clear();
          password.clear();
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }

  _navigator() {
    if (username.text.length != 0 || password.text.length != 0) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new Tugaspertemuan8()),
              (Route<dynamic> route) => false);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          child: new CupertinoAlertDialog(
            content: new Text(
              "username or password \n can't be empty",
              style: new TextStyle(fontSize: 16.0),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("OK"))
            ],
          ));
    }
  }
}