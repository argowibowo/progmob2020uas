import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180247/UAS/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_72180247/UAS/FadeAnimation.dart';

class LoginUas extends StatefulWidget {
  @override
  _LoginUasState createState() => new _LoginUasState();
}

class _LoginUasState extends State<LoginUas> {
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
      backgroundColor: Color(0xffff4d4d),
      body: new SingleChildScrollView(
        child: _body(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
  Widget _body() {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
              Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.fill
                  )
              ),
                child: Stack(
                  children: <Widget>[
                  Positioned(
                  left: 20,
                  width: 100,
                  height: 200,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/light-1.png')
                          )
                      ),
                    )),
                ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/light-2.png')
                          )
                      ),
                    )),
                  ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.5, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/clock.png')
                            )
                        ),
                      )),
                    ),
                  ],
                ),
                ),
                  new TextField(
                    controller: username,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        hintText: "Username",
                        hintStyle: new TextStyle(color: Colors.white.withOpacity(0.3))),
                  ),
                  new TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          hintText: "Password",
                          hintStyle:
                          new TextStyle(color: Colors.white.withOpacity(0.3)))),
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
          ),
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
              builder: (BuildContext context) => new HomePage()),
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