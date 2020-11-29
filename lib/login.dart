import 'package:flutter/material.dart';
import 'package:flutter_72180264progmob/tugasPertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
  }

  class _LoginState extends State<Login> {
  String username = 'Ester Siwu';
  String password = '72180264';

      TextEditingController usernameController = new TextEditingController();
      TextEditingController passwordController = new TextEditingController();
      final formKey = new GlobalKey<FormState>();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30),
                  ),
                  _formBuilder(),
                ],
              ),
            ),
          ),
        );
      }

      Widget _formBuilder() {
        return Form(
          key: formKey,
          child: Column(
              children: <Widget>[
          Padding(
          padding: const EdgeInsets.all(35),
          child: TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            validator: (value) {
              return value.isEmpty ? "Username tidak boleh kosong" : null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 15)
              ),
              icon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent, width: 1.0)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent, width: 1.0)),
              labelText: 'username',
              labelStyle: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(30),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.black),
          validator: (value) {
            return value.isEmpty ? "Password tidak boleh kosong" : null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)
        ),
        icon: Icon(
        Icons.vpn_key,
        color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.0)),
        labelText: 'username',
        labelStyle: TextStyle(
        color: Colors.blueAccent,
    ),
    ),
    ),
    ),
    Container(
    child: FlatButton(
    onPressed: () {},
    child: Text(
    'Lupa Password',
    style: TextStyle(
    color: Colors.lightBlue,
    fontSize: 20,
    fontWeight: FontWeight.w400),
    ),
    ),
    ),
        RaisedButton(
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setInt("is_login", 0);
          Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => TugasPertemuan8(title: "Push",)),
        );
      },
      color: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Center(
        child: Text('Login', style: TextStyle(
        fontSize: 20,
        color: Colors.white
        ),
        ),
        ),
        ),
        )
        ],
        ),
    );
  }
}