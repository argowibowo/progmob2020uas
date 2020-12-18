import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wil_app/Tugaspertemuan8.dart';
import 'package:wil_app/dashboardwil.dart';


// SharedPreferences isLogin;
class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  // Initially password is obscure
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final myUsernameController = TextEditingController();
//   final myPasswordController = TextEditingController();
//   String username, password;
//   bool showPassword = false;
//
//   void navigateLogin() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     int isLogin = pref.getInt("is_login");
//     if (isLogin == 1) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Dashboardwil(title: "Sistem Informasi Akademik",)),
//       );
//     }
//   }

  // @override
  // void initState() {
  //   navigateLogin();
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.lightBlue[600],
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration: new InputDecoration(

                    hintText: "Username",
                    labelText: "Username",
                  ),

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",



                  ),



                ),

              ),


              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    SharedPreferences pref = await SharedPreferences
                        .getInstance();
                    await pref.setInt("is_login", 1);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboardwil(title: "Sistem Informasi Akademik",)),
                    );
                    // }
                    _formKey.currentState.save();
                  }
                },
              )



            ],
          ),
        ),
      ),
    );
  }
}
