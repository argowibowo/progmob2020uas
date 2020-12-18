import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/components/constant.dart';
import 'package:progmob_flutter/dashbord.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

// SharedPreferences isLogin;
//
// class Login extends StatefulWidget {
//   Login({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final myUsernameController = TextEditingController();
//   final myPasswordController = TextEditingController();
//   String username, password, message = '';
//   bool showPassword = false;
//
//   // LoginRequest loginRequest;
//   LoginResult loginResult = new LoginResult();
//
//   void navigateLogin() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     int isLogin = pref.getInt("is_login");
//     if(isLogin == 1){
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halaman Utama",)),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     navigateLogin();
//     // loginRequest = new LoginRequest();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           // padding: EdgeInsets.all(20.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 // margin: EdgeInsets.only(left: 20, right: 20),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     colors: [
//                       Colors.cyan[500],
//                       Colors.cyan[300],
//                       Colors.cyan[200],
//                     ]
//                   ),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(60),
//                     bottomRight: Radius.circular(60)
//                   )
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     new Image.asset(
//                       "images/logo.png",
//                       width: 190,
//                       height: 190,
//                     ),
//                     Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(60),
//                               topRight: Radius.circular(60)
//                             )
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(20.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.all(20.0),
//                                 ),
//                                 new TextFormField(
//                                   validator: (value){
//                                     if(value.isEmpty && value.length == 0) {
//                                       return "Username tidak boleh kosong";
//                                       // } else if (!value.contains('72180180')){
//                                       //   return "Username Anda salah";
//                                     } else
//                                       return null;
//                                   },
//                                   // onSaved: (String value){
//                                   //   this.loginResult.nimnik = value;
//                                   // },
//                                   controller: myUsernameController,
//                                   decoration: new InputDecoration(
//                                     // icon: const Icon(Icons.person),
//                                     labelText: "Username",
//                                     border: OutlineInputBorder(
//                                       borderRadius: new BorderRadius.circular(29),
//                                     ),
//                                     prefixIcon: IconButton(
//                                       icon: Icon(
//                                         Icons.person,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                 ),
//                                 new TextFormField(
//                                   validator: (value){
//                                     if(value.isEmpty && value.length == 0) {
//                                       return "Password tidak boleh kosong";
//                                       // } else if (!value.contains('12345')){
//                                       //   return "Password Anda salah";
//                                     } else
//                                       return null;
//                                   },
//                                   // onSaved: (String value){
//                                   //   this.loginResult.password = value;
//                                   // },
//                                   obscureText: !this.showPassword,
//                                   controller: myPasswordController,
//                                   decoration: new InputDecoration(
//                                     // icon: const Icon(Icons.lock),
//                                     labelText: "Password",
//                                     border: OutlineInputBorder(
//                                       borderRadius: new BorderRadius.circular(29),
//                                     ),
//                                     prefixIcon: IconButton(
//                                       icon: Icon(Icons.lock),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         showPassword ? Icons.visibility : Icons.visibility_off,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           this.showPassword = !this.showPassword;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                 ),
//                                 RaisedButton (
//                                   color: Colors.cyan,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30.0)
//                                   ),
//                                   // disabledColor: Colors.blue,
//                                   child: Text(
//                                     "Login",
//                                     style: TextStyle(
//                                         color: Colors.white
//                                     ),
//                                   ),
//                                   onPressed: () async {
//                                     if(_formKey.currentState.validate()){
//                                       // get value from textbox
//                                       _formKey.currentState.save();
//                                       username = myUsernameController.text;
//                                       password = myPasswordController.text;
//                                       // if(loginResult.nimnik != username){
//                                       //   return "Username anda salah";
//                                       // } else if(loginResult.password != password){
//                                       //   return "Password anda salah";
//                                       // } else {
//                                         ApiServices().userLogin(this.username, this.password).then((isSuccess) {
//                                           // loginResult = isSuccess;
//                                           // setState(() {});
//                                         });
//                                       // ApiServices().userLogin(this.loginResult).then((isSuccess) {
//                                       //   // loginResult = isSuccess;
//                                       //   // setState(() {});
//                                       // });
//                                         SharedPreferences pref = await SharedPreferences.getInstance();
//                                         await pref.setInt("is_login", 1);
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)),
//                                         );
//                                       // }
//                                       _formKey.currentState.save();
//                                     }
//                                   },
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                     ),
//
//                   ],
//                 ),
//                 // child: new Image.asset(
//                 //   "images/logo.png",
//                 //   width: 190,
//                 //   height: 190,
//                 // ),
//               ),
//               // Padding(
//               //   padding: EdgeInsets.all(20.0),
//               //   child: Column(
//               //     children: <Widget>[
//               //       new TextFormField(
//               //         validator: (value){
//               //           if(value.isEmpty && value.length == 0) {
//               //             return "Username tidak boleh kosong";
//               //             // } else if (!value.contains('72180180')){
//               //             //   return "Username Anda salah";
//               //           } else
//               //             return null;
//               //         },
//               //         // onSaved: (input) => loginRequest.nimnik = input,
//               //         controller: myUsernameController,
//               //         decoration: new InputDecoration(
//               //           // icon: const Icon(Icons.person),
//               //           labelText: "Username",
//               //           border: OutlineInputBorder(
//               //             borderRadius: new BorderRadius.circular(29),
//               //           ),
//               //           prefixIcon: IconButton(
//               //             icon: Icon(
//               //               Icons.person,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //       Padding(
//               //         padding: EdgeInsets.all(5.0),
//               //       ),
//               //       new TextFormField(
//               //         validator: (value){
//               //           if(value.isEmpty && value.length == 0) {
//               //             return "Password tidak boleh kosong";
//               //             // } else if (!value.contains('12345')){
//               //             //   return "Password Anda salah";
//               //           } else
//               //             return null;
//               //         },
//               //         // onSaved: (input) => loginRequest.password = input,
//               //         obscureText: !this.showPassword,
//               //         controller: myPasswordController,
//               //         decoration: new InputDecoration(
//               //           // icon: const Icon(Icons.lock),
//               //           labelText: "Password",
//               //           border: OutlineInputBorder(
//               //             borderRadius: new BorderRadius.circular(29),
//               //           ),
//               //           prefixIcon: IconButton(
//               //             icon: Icon(Icons.lock),
//               //           ),
//               //           suffixIcon: IconButton(
//               //             icon: Icon(
//               //               showPassword ? Icons.visibility : Icons.visibility_off,
//               //             ),
//               //             onPressed: () {
//               //               setState(() {
//               //                 this.showPassword = !this.showPassword;
//               //               });
//               //             },
//               //           ),
//               //         ),
//               //       ),
//               //       Padding(
//               //         padding: EdgeInsets.all(5.0),
//               //       ),
//               //       RaisedButton (
//               //         color: Colors.cyan,
//               //
//               //         // disabledColor: Colors.blue,
//               //         child: Text(
//               //           "Login",
//               //           style: TextStyle(
//               //               color: Colors.white
//               //           ),
//               //         ),
//               //         onPressed: () async {
//               //           if(_formKey.currentState.validate()){
//               //             // get value from textbox
//               //             username = myUsernameController.text;
//               //             password = myPasswordController.text;
//               //             if(loginResult.nimnik != username){
//               //               return "Username anda salah";
//               //             } else if(loginResult.password != password){
//               //               return "Password anda salah";
//               //             } else {
//               //               ApiServices().userLogin(this.username, this.password).then((isSuccess) {
//               //                 // loginResult = isSuccess;
//               //                 // setState(() {});
//               //               });
//               //               SharedPreferences pref = await SharedPreferences.getInstance();
//               //               await pref.setInt("is_login", 1);
//               //               Navigator.pushReplacement(
//               //                 context,
//               //                 MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)),
//               //               );
//               //             }
//               //             _formKey.currentState.save();
//               //           }
//               //         },
//               //       )
//               //     ],
//               //   ),
//               // ),
//
//             ],
//           ),
//         )
//
//       ),
//     );
//   }
// }

SharedPreferences isLogin;
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;

  LoginResult loginResult = new LoginResult();

  // void navigateLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int isLogin = pref.getInt("is_login");
  //   if(isLogin == 1){
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halaman Utama",)),
  //     );
  //   }
  // }

  @override
  void initState() {
    // navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // padding: EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.cyan[500],
                            Colors.cyan[300],
                            Colors.cyan[200],
                            Colors.cyan[100]
                          ]
                      ),
                      // borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(60),
                      //     bottomRight: Radius.circular(60)
                      // )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "images/logo.png",
                        width: 190,
                        height: 190,
                      ),
                      new Container(
                          height: 350,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60)
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                ),
                                new TextFormField(
                                  validator: (value){
                                    if(value.isEmpty && value.length == 0) {
                                      return "Username tidak boleh kosong";
                                      // } else if (!value.contains('72160000')){
                                      //   return "Username Anda salah";
                                    } else
                                      return null;
                                  },
                                  onSaved: (String value){
                                    this.loginResult.nimnik = value;
                                  },
                                  decoration: new InputDecoration(
                                    labelText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(29),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.person,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                ),
                                new TextFormField(
                                  validator: (value){
                                    if(value.isEmpty && value.length == 0) {
                                      return "Password tidak boleh kosong";
                                      // } else if (!value.contains('12345')){
                                      //   return "Password Anda salah";
                                    } else
                                      return null;
                                  },
                                  onSaved: (String value){
                                    this.loginResult.password = value;
                                  },
                                  obscureText: !this.showPassword,
                                  decoration: new InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(29),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.lock),
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
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                ),
                                RaisedButton (
                                  color: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  onPressed: () async {
                                    if(_formKey.currentState.validate()){
                                      _formKey.currentState.save();
                                      ApiServices().userLogin(this.loginResult).then((isSuccess) async {
                                        // setState(() => isLoading = false);
                                        if (isSuccess) {
                                          // print("MASOK IS SUCESS");
                                          SharedPreferences pref = await SharedPreferences.getInstance();
                                          await pref.setInt("is_login", 1);
                                          Navigator.pushReplacement(
                                            context,
                                            // MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard", username: loginResult.nimnik,)),
                                            MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard")),
                                          );
                                        } else {
                                          // print("MASOK ELSE");
                                          Fluttertoast.showToast(
                                              msg: "Invalid username or password",
                                          );
                                        }
                                      });
                                      // }
                                      // SharedPreferences pref = await SharedPreferences.getInstance();
                                      // await pref.setInt("is_login", 1);
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)),
                                      // );
                                      // }
                                      // _formKey.currentState.save();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}