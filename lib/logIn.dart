import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:flutter_progmob_app/tugasPertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LogIn extends StatefulWidget {
  LogIn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LogInState createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
String username = 'Nikita Semben';
String password = '123456';

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
              padding: EdgeInsets.all(50),
            ),
            _formBuilder(),
          ],
        ),
      ),
    ),
  );
}

Widget _formBuilder(){
  return Form(
    key: formKey,
    // autovalidate: true,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            validator: (value){
              return value.isEmpty ? "Username Tidak Boleh Kosong" : null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 10)
              ),
              icon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.5)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.5)),
              labelText: 'Username',
              labelStyle: TextStyle(
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            validator: (value){
              return value.isEmpty ? "Password Tidak Boleh Kosong" : null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue)
              ),
              icon: Icon(
                Icons.vpn_key,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.5),),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue, width: 1.5)),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
        Container(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Lupa Password ?',
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
                  MaterialPageRoute(builder: (context)=>TugasPertemuan8(title: 'Push')));
          },
          color: Colors.lightBlue,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Center(
              child: Text('Login', style: TextStyle(
                  fontSize: 24,
                  color: Colors.white
              ),),
            ),
          ),
        ),
      ],
    ),
  );
}
}
