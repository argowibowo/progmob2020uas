import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/splashscreen.dart';
import 'package:progmob_flutter/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(title : "Dashbooard")),
      );
    }
  }


  @override
  void initState() {
    navigateLogin();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("LOGIN"),
      ),

      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(
                Icons.people,
                size: 120.0,
                color: Colors.grey,
              ),

              Text("FLUTTER 2020",
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),

              SizedBox(height: 15.0,),

              // TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Masukkan Username Anda",
                  labelText: "Username",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Username tidak boleh kosong';
                  }
                  return null;
                },
              ),

              Padding(
                padding: EdgeInsets.all(5.0),
              ),

              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Masukkan Password Anda",
                  labelText: "Password",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),

              RaisedButton(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {}
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 1);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Dashboard(title: "Dashboard")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}