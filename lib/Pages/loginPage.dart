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

import 'forgotPage.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;
  String email;
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

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                          Icons.email,
                          color: Colors.lightBlue,
                        ),
                        title: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if (value.isEmpty){
                              return "Please fill Email";
                            }
                            return null;
                          },
                          onChanged: (value){
                            email = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
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
                          onChanged: (value){
                            password = value;
                          },
                          obscureText: _obscureText,
                          autofocus: false,
                          initialValue: '',
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
                          setState(() {
                            showSpinner = true;
                          });
                          try{
                            // final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (BuildContext context) => MyBottomNavigationBar()));
                            // if (user != null){1
                            //
                            // }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                          on PlatformException catch (e) {
                            // Alert(
                            //   context: context,
                            //   type: AlertType.warning,
                            //   title: "Error",
                            //   desc: "Please ensure that your email and password are correct!",
                            //   buttons: [
                            //     DialogButton(
                            //       child: Text(
                            //         "Got It",
                            //         style: TextStyle(color: Colors.white, fontSize: 20),
                            //       ),
                            //       onPressed: () => Navigator.pushNamed(context, LoginPage.id),
                            //       width: 120,
                            //     )
                            //   ],
                            // ).show();
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
