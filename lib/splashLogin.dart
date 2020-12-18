// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/constants.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/pertemuan1.dart';
import 'package:progmob_flutter/tugasPertemuan1Widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progmob_flutter/validation.dart';

void main(){
  runApp(MyApp());
}

//stateless : tidak bisa diotak atik.
class MyApp extends StatelessWidget {
  //biar gak kedip2

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme:ThemeData(
        //menggambil kelas apa yang nanti digunakan pake home
        primarySwatch : Colors.deepPurple[900],
        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashLogin(
          title:"Flutter Home Page"
      ),
    );
  }
}

class SplashLogin extends StatefulWidget{
  SplashLogin({Key key, this.title}) :super(key:key);
  final String title;


  @override
  _SplashLoginState createState()=> _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> with Validation{
  String nama = '';
  String password = '';
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  Login login = new Login();

  _displayCantLogin(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (context) {

          return AlertDialog(

            elevation: 2,
            title: Text(
              "Anda Tidak Bisa Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              "NIM / Password Anda tidak valid!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple[900],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () async{
                  Navigator.pop(context);
                },
                child: Text(
                  "Coba lagi",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          );
        });
  }

//FUNGSI NAVIGATE
  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  }
  @override
  void initState() {
    navigateLogin();
  }


  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Form(
      key : formKey,
      child: Column(
      mainAxisSize : MainAxisSize.min,
      children: <Widget>[
        Flexible(
            flex: 2,
            child: Stack(
                children: <Widget>[
                  //CONTAINER BACKGROUND
                  Container(
                    color: Color(0xFFF2F2F2),
                    height: MediaQuery.of(context).size.height,
                  ),
                  //Container kedua image
                  Container(
                      height: MediaQuery.of(context).size.height / 2.4,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                            image: AssetImage('assets/logo_progmob2020.png'),
                            fit: BoxFit.cover,
                          )
                      )
                  ),
                  //BAGIAN INI KITA GUNAKAN POSITIONED UNTUK MENGATUR SUDUTNYA
                  //Jarak daritatas ambil height dibagi 3.6
                  Positioned(
                      top: MediaQuery.of(context).size.height / 3.6,
                      //ISINYA ADALAH CONTAINER YANG WIDTHNYA SELEBAR MUNGKIN
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child : Card(
                          //LALU CARD KITA SET MARGINNYA 20 DARI CONTAINER
                            margin: const EdgeInsets.all(20.0),
                            elevation: 8, //KETEBALANNYA
                            child: Padding(
                              //KEMUDIAN COLUMN KITA SET LAGI PADDINGNYA DARI CARD
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //BAGIAN PERTAMA ADALAH TEKS FORM LOGIN
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Login Form",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      //KEMUDIAN SEBUAH TEKS FIELD UNTUK MENGINPUT EMAIL
                                      TextFormField(
                                        //DIMANA DEKORASINYA PADA SIFFUX BERARTI AKHIR BERISI ICON EMAIL BERWARNA PINK
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.person,
                                            color: Colors.deepPurple[900],
                                          ),
                                          //KETIKA INPUTAN TERSEBUT DIKLIK MAKA AKAN MEMBUAT UNDERLINE
                                          focusedBorder: UnderlineInputBorder(
                                            //DENGAN BORDER BERWARNA PINK
                                            borderSide: BorderSide(
                                              color: Colors.deepPurple[900],
                                            ),
                                          ),
                                          labelText: "Username ", //SET LABELNYA
                                          //DAN SET STYLE DARI LABEL, CARA KERJANYA SAMA DENGNA TEXT STYLE KETIKA DISEMATKAN PADA TEXT() WIDGET
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: validateUser,
                                        onSaved: (String value){
                                          this.login.nimnik = value;
                                        },
                                      ),
                                      TextFormField(
                                        obscureText : !this._passwordVisible,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.security,
                                            color: Colors.deepPurple[900],
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.deepPurple[900],
                                            ),
                                          ),
                                          labelText: "Password ",
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        validator: validatePass,
                                        onSaved: (String value){
                                          this.login.password = value;
                                        },
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(80.0),
                                        ),
                                        padding: const EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(80.0),
                                            ),
                                          ),
                                          child: Container(
                                            constraints : const BoxConstraints(
                                              minWidth: 150.0,
                                              minHeight: 36.0,
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Login',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed:() async {

                                          if(formKey.currentState.validate()){
                                            formKey.currentState.save();
                                            ApiServices().login(this.login).then((isSuccess) async{
                                              if(isSuccess){
                                              SharedPreferences pref = await SharedPreferences.getInstance();
                                              await pref.setInt("isLogin", 1);
                                              Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => Dashboard(title: "Home Page",)),
                                              //push biar ga ada backnya pake push replacement, kalo di back ntar item
                                              );
                                              } else{
                                                _displayCantLogin(context);
                                              }
                                            });

                                          }
                                        },
                                      ),
                                    ]
                                )
                            )
                        ),
                      ))

                ]
            )
        ),
      ],
      )
    );
    /*double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size; //nanti menyediakan total tinggi dan lebar screen
    return Scaffold(
     body:Container(
       height: height,
        width: width,
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
          width: width,
          child: Image.asset("assets/login_img.png",fit: BoxFit.fill,),
        ),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
         key : formKey,
          child: Column(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.all(36.0),
              ),
              //MEMBUAT TEXT INPUT
              TextFormField(
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Username",
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                validator: validateUser,
                onSaved: (String value){
                  this.log.nimnik = value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
              ),
              TextFormField(
                obscureText : true,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText:"Password",
                  prefixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                validator: validateUser,
                onSaved: (String value){
                  this.log.password = value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.greenAccent)
                ),
                color: Colors.greenAccent,
                      child: Text(
                          "Login",
                        style: TextStyle(
                          //kasih warna text
                            color: Colors.white
                        ),
                ),
                //------------------PINDAH HALAMAN
                onPressed:() async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("isLogin", 1);
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard(title: "Home Page",)),
                    //push biar ga ada backnya pake push replacement, kalo di back ntar item
                      );
                  }
                },
              )
            ]
          ),
        ),
       ]
        ),
      ),
     ),
    );*/
  }
}

class FormLogin extends StatelessWidget with Validation {
  FormLogin({
    Key key,

  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key : formKey,

    );
  }
  }

