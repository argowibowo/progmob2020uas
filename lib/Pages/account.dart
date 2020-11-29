import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:progmob_aftuts/Colors/constant.dart';
import 'package:progmob_aftuts/Pages/loginPage.dart';

// WARNING, NOTE BUAT TEMAN TEMAN HEHE
// BAKAL KETAUAN KALO COPY CODE PROGRAM
// KARENA CODINGAN INI BELUM DIAJARKAN DI MATERI PERKULIAHAN
// COPY BOLEH TAPI JANGAN DIJIPLAK YA :D, HARUS DIPAHAMI ALURNYA

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/images/0.jpg"),
                    ),
                    Text(
                      'Ken Sanio',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40.0,
                          color: kTitleTextColor,
                      ),
                    ),
                    Text(
                      'INFORMATIONS SYSTEM STUDENT',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: kPrimaryColor,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 300.0,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.lightBlue,
                          ),
                          title: Text('72180234',
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                            ),
                          ),
                        )
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.lightBlue,
                          ),
                          title: Text('ken.thea16@gmail.com',
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                            ),
                          ),
                        )
                    ),
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
                                  builder: (BuildContext context) => LoginPage()));
                              // if (user != null){1
                              //
                              // }
                              setState(() {
                                showSpinner = false;
                              });
                            }
                            on PlatformException catch (e) {
                            }
                          },
                          child: Container(
                            width: 400.0,
                            height: 55.0,
                            child: ListTile(
                                title: Text(
                                  "Logout",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: kBackgroundColor,
                                  ),
                                )),
                          ),
                        )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
