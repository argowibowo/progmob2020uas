import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:progmob_aftuts/Colors/constant.dart';
import 'package:progmob_aftuts/Animation/fadeAnimation.dart';
import 'package:progmob_aftuts/Pages/landingPage.dart';
// import 'package:plagiatcheck/login/forgot.dart';
// import 'package:plagiatcheck/login/signPage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:progmob_aftuts/tugaspertemuan8.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgotPage.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

SharedPreferences isLogin;

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;
  String username;
  String password;
  // WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA




  // final GoogleSignIn googleSignIn = new GoogleSignIn();
  // Future<String> _testSignInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
  //   assert(user.email != null);
  //   assert(user.displayName != null);
  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);
  //Hasil Kodingan Ken coba firebase
  //   final FirebaseUser currentUser = await _auth.currentUser();
  //   assert(user.uid == currentUser.uid);
  //Hasil Kodingan Ken coba firebase
  //   return 'signInWithGoogle succeeded: $user'; // Hasil Kodingan Ken coba firebase
  //Hasil Kodingan Ken coba firebase
  // }

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  bool showPassword = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    navigateLogin();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                  1.1,
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.lightBlue[600],
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                FadeAnimation(
                  1.3,
                  Text(
                    'Hello There',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Text(
                    'Sign in to Continue',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Colors.teal.shade100,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 300.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                FadeAnimation(
                  1.7,
                  Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.lightBlue,
                        ),
                        title: TextFormField(
                          validator: (value){
                            if(value.isEmpty && value.length == 0) {
                              return "*Username tidak boleh kosong";
                            }
                            else if (!value.contains('72180234')){
                              return "Username Anda salah";
                            }
                            else
                              return null;
                          },
                          controller: myUsernameController,
                          onChanged: (value){
                            username = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              )),
                        ),
                      )),
                ),
                FadeAnimation(
                  1.9,
                  Card(
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Colors.lightBlue,
                        ),
                        title: TextFormField(
                          validator: (value){
                            if(value.isEmpty && value.length == 0) {
                              return "*Password tidak boleh kosong";
                            } else if (!value.contains('12345')){
                              return "Password Anda salah";
                            } else
                              return null;
                          },
                          obscureText: _obscureText,
                          controller: myPasswordController,
                          autofocus: false,
                          // initialValue: '',
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _toggle();
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _obscureText
                                    ? Colors.grey
                                    : Colors.lightGreen[600],
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )),
                ),
                FadeAnimation(
                  2.1,
                  Container(
                      alignment: Alignment.topRight,
                      width: 350,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPage()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
                FadeAnimation(
                  2.3,
                  Card(
                      color: Colors.lightBlue[600],
                      margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                      child: new InkWell(
                        onTap: () async {
                          if(_formKey.currentState.validate()){
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            await pref.setInt("is_login", 1);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
                            );
                            // }
                            _formKey.currentState.save();
                          }
                        },
                        child: Container(
                          width: 400.0,
                          height: 55.0,
                          child: ListTile(
                              title: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kBackgroundColor,
                                ),
                              )),
                        ),
                      )),
                ),
                // FadeAnimation(
                //   2.3,
                //   Card(
                //       color: Colors.blue,
                //       margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                //       child: InkWell(
                //         onTap: () async {
                //           try{
                //             final user = await _testSignInWithGoogle();
                //             if (user != null){
                //             }
                //             setState(() {
                //               showSpinner = true;
                //             });
                //           }
                //           catch (e) {
                //             print(e);
                //             Navigator.pushNamed(context, MyBottomNavigationBar.id);
                //           }
                //         },
                //         child: Container(
                //           width: 400.0,
                //           height: 55.0,
                //           child: ListTile(
                //               leading: ImageIcon(
                //                 AssetImage('assets/images/google.png'),
                //               ),
                //               title: Text(
                //                 "Sign in With Google",
                //                 textAlign: TextAlign.start,
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                   color: kBackgroundColor,
                //                 ),
                //               )),
                //         ),
                //       )),
                // ),
                SizedBox(
                  height: 25.0,
                ),
                FadeAnimation(
                  2.3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an Account?',
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPage()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
