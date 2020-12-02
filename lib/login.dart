import 'package:flutter/material.dart';
import 'package:ronaldo_flutter_progmob_2020/homie.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences isLogin;

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;
  bool showPassword = false;

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(title: "Home",)),
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
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 5,
                  child: new Image.asset(
                    "images/Sliwat.png",
                    // width: 200,
                    // height: 200,
                  ),
                ),
                new TextFormField(
                  validator: (value) {
                    if (value.isEmpty && value.length == 0) {
                      return "Username Gak Boleh Kosong Dab";
                    } else
                      return null;
                  },
                  controller: myUsernameController,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.account_circle),
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new TextFormField(
                  validator: (value) {
                    if (value.isEmpty && value.length == 0) {
                      return "Password Gak Boleh Kosong";
                    } else
                      return null;
                  },
                  obscureText: !this.showPassword,
                  controller: myPasswordController,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          this.showPassword = !this.showPassword;
                        });
                      },
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      SharedPreferences pref = await SharedPreferences
                          .getInstance();
                      await pref.setInt("is_login", 1);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(title: "Home",)),
                      );
                      // }
                      _formKey.currentState.save();
                    }
                  },
                )
              ],
            ),
          )

      ),
    );
  }
}