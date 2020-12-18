import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_72180200/home_view.dart';
import 'package:flutter_72180200/main.dart';
import 'package:flutter_72180200/model.dart';
import 'package:flutter_72180200/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apiservices.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();



class Login extends StatefulWidget{
  Login({Key key,@required this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState(title);
}

class _LoginState extends State<Login>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>(); //buat validasi
  final String title;
  _LoginState(this.title);
  bool _isLoading = false;
  LoginProgmob login = new LoginProgmob();

  // UNTUK ALERT DIALOG SAAT NIM/ PASSWORD SALAH SHG TIDAK BISA LOGIN
  _displayDialogCantLogin(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 2,
            title: Text(
              "Anda Tidak Bisa Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              "NIM / Password Anda tidak valid!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0D47A1),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () async{
                  Navigator.pop(context);
                },
                child: Text(
                  "Keluar",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container( //ini utk logo diatas
                height: 650,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                    "images/logo_progmob.png",
                      width: 250,
                      height: 250,
                    ),
                    Expanded(
                      child: Container( //ini utk text input dan button login
                        margin: EdgeInsets.only(left:20, right:20),
                        //width: MediaQuery.of(context).size.width,
                        //height: 300,
                        //padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF64B5F6)
                            ],
                          ),
                            //color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(70),
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(15),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15,15,15,5),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value){
                                    if(value.isEmpty && value.length == 0){
                                      return "NIM Harus Diisi";
                                    } else if(value.length < 8 || value.length > 8){
                                      return "NIM Harus 8 Karakter";
                                    } else
                                      return null;
                                  },
                                  decoration: new InputDecoration(
                                    icon: Icon(
                                      Icons.people,
                                      color: Colors.white,
                                    ),
                                    labelText: "NIM",
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    hintText: "Contoh: 72180200",
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(10),
                                      borderSide: new BorderSide(color: Colors.white),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    focusColor: Colors.white,
                                    errorStyle: TextStyle(color: Colors.lightBlueAccent),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                                    ),
                                    focusedErrorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                                    ),
                                    enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                                      borderSide: new BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                  ),
                                  onSaved: (String value){
                                    this.login.nimnik = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15,15,15,5),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  obscureText: true, //supaya gak kelihatan passwordnya
                                  validator: (value){
                                    if(value.isEmpty && value.length == 0){
                                      return "Password Harus Diisi";
                                    } else{
                                      return null;
                                    }
                                  },
                                  decoration: new InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    hintText: "**********",
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(10),
                                      borderSide: new BorderSide(color: Colors.white),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    focusColor: Colors.white,
                                    errorStyle: TextStyle(color: Colors.lightBlueAccent),
                                    errorBorder: new OutlineInputBorder( //untuk ganti warna border pas error
                                      borderSide: new BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                                    ),
                                    focusedErrorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                                    ),
                                    enabledBorder: new OutlineInputBorder( //utk ganti warna border di textinputnya
                                      borderSide: new BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                  ),
                                  onSaved: (String value){
                                    this.login.password = value;
                                  },
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10)
                              ),
                              ButtonTheme(
                                minWidth: 150.0,
                                height: 50.0,
                                child: RaisedButton(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.white,
                                  disabledColor: Colors.white,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0D47A1),
                                      fontSize: 15.0,
                                      height: 1,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if(_formKey.currentState.validate()){
                                      _formKey.currentState.save();
                                      ApiServices().loginProgmob(this.login).then((isSuccess) async {
                                        if(isSuccess) {
                                          //_displayDialogLogin(context);
                                          SharedPreferences pref = await SharedPreferences.getInstance();
                                          await pref.setInt("is_login_progmob", 1);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomePage(title: "Home", /*login: this.login,*/)),
                                          );
                                        } else {
                                          _displayDialogCantLogin(context);
                                        }
                                      });
                                    }
                                    },
                                  ),
                                ),
                              Padding(
                                  padding: EdgeInsets.all(10)
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Anda belum mendaftar? Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}