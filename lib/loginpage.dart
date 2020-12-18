import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/apiservices.dart';
import 'package:progmob_setelah_uts_72180190/dashboard.dart';
import 'package:progmob_setelah_uts_72180190/model.dart';
import 'package:progmob_setelah_uts_72180190/pertemuan1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'validation.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with Validation {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final formkey = GlobalKey<FormState>();

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Dashboard(
                // title: "Home Page"
                )),
      );
    }
  }

  LoginRes login = new LoginRes();
  bool _isLoading = false;

  _loginFail(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Failed!"),
            content:
                Text("NIM / NIK atau Password Salah Silahkan Coba Kembali!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    navigateLogin();
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Nama Tidak Boleh Kosong !!!';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password Tidak Boleh Kosong !!!';
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.cyan[700],
          Colors.cyan[400],
          Colors.cyan[100],
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 206, 209, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "NIM / NIK",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: validateUsername,
                                    keyboardType: TextInputType.number,
                                    onSaved: (String value) {
                                      this.login.nimnik = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: validatePassword,
                                    onSaved: (String value) {
                                      this.login.password = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.cyan[400]),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              setState(() => _isLoading = true);
                              ApiServices()
                                  .login(this.login)
                                  .then((isSuccess) async {
                                setState(() => _isLoading = false);
                                if (isSuccess) {
                                  SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                                  await pref.setInt("is_login", 1);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard(
                                            // title: "Home Page",
                                          )));
                                } else {
                                  _loginFail(context);
                                }
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       Container(
    //         height: size.height * 0.3,
    //       ),
    //       SafeArea(
    //         child: Padding(
    //           padding: EdgeInsets.all(16.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Container(
    //                 height: 300,
    //                 child: Card(
    //                   elevation: 5,
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(15)),
    //                   child: Form(
    //                     key: formKey,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: <Widget>[
    //                         TextFormField(
    //                           decoration: new InputDecoration(
    //                               contentPadding: EdgeInsets.all(10),
    //                               // icon: Icon(Icons.people),
    //                               labelText: "NIM / NIK",
    //                               hintText: "NIM / NIK",
    //                               border: OutlineInputBorder(
    //                                 borderRadius: new BorderRadius.circular(20),
    //                               )),
    //                           validator: validateUsername,
    //                           keyboardType: TextInputType.number,
    //                           onSaved: (String value) {
    //                             this.login.nimnik = value;
    //                           },
    //                           // validator: validateUsername,
    //                           // onSaved: (String value) {
    //                           //   name = value;
    //                           // },
    //                         ),
    //                         Padding(padding: EdgeInsets.all(10.0)),
    //                         TextFormField(
    //                           obscureText: true,
    //                           decoration: new InputDecoration(
    //                               contentPadding: EdgeInsets.all(10),
    //                               // icon: Icon(Icons.vpn_key),
    //                               labelText: "Password",
    //                               hintText: "Password",
    //                               border: OutlineInputBorder(
    //                                 borderRadius: new BorderRadius.circular(20),
    //                               )),
    //                           validator: validatePassword,
    //                           onSaved: (String value) {
    //                             this.login.password = value;
    //                           },
    //                           // validator: validateUsername,
    //                           // onSaved: (String value) {
    //                           //   name = value;
    //                           // },
    //                         ),
    //                         RaisedButton(
    //                           elevation: 5,
    //                           color: Colors.cyan,
    //                           child: Text(
    //                             "Login",
    //                             style: TextStyle(color: Colors.white),
    //                           ),
    //                           onPressed: () async {
    //                             if (formKey.currentState.validate()) {
    //                               formKey.currentState.save();
    //                               setState(() => _isLoading = true);
    //                               ApiServices()
    //                                   .login(this.login)
    //                                   .then((isSuccess) async {
    //                                 setState(() => _isLoading = false);
    //                                 if (isSuccess) {
    //                                   SharedPreferences pref =
    //                                       await SharedPreferences.getInstance();
    //                                   await pref.setInt("is_login", 1);
    //                                   Navigator.pushReplacement(
    //                                       context,
    //                                       MaterialPageRoute(
    //                                           builder: (context) => Dashboard(
    //                                               // title: "Home Page",
    //                                               )));
    //                                 } else {
    //                                   _loginFail(context);
    //                                 }
    //                               });
    //                             }
    //                           },
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
