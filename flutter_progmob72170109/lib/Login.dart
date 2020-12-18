import 'package:flutter/material.dart';
import 'package:flutter_progmob72170109/uasprogmob.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = 'example : Melsiora Fernandes';
  String password = '72170109';

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
              style: TextStyle(color: Colors.purple),
              validator: (value){
                return value.isEmpty ? "Username Tidak Boleh Kosong" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen, width: 10)
                ),
                icon: Icon(
                  Icons.people,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 1.6)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 1.6)),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.purple),
              validator: (value){
                return value.isEmpty ? "Silaka Isi kode Password Disini" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)
                ),
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 1.6),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 1.6)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 21,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>uasprogmob(title: 'Push')));
            },
            color: Colors.lightGreen,
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Center(
                child: Text('Login', style: TextStyle(
                    fontSize: 25,
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