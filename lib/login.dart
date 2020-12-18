import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences isLogin;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          // using SingleChildScrollView biar tidak ada garis markanya :)
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Icon(
                  Icons.school,
                  size: 120.0,
                  color: Colors.deepOrange,
                ),

                Text("PROGMOB FLUTTER 2020",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),

                SizedBox(height: 15.0,),

                new TextFormField(
                  validator: (value){
                    if(value.isEmpty && value.length == 0) {
                      return "Username tidak boleh kosong";
                    } else if (!value.contains('72160000')){
                      return "Password atau username Anda salah";
                    } else
                      return null;
                  },
                  controller: myUsernameController,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.person),
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty && value.length == 0) {
                      return "Password tidak boleh kosong";
                    } else if (!value.contains('progmob')){
                      return "Password atau username Anda salah";
                    } else
                      return null;
                  },
                  obscureText: !this.showPassword,
                  controller: myPasswordController,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Icons.visibility_off,
                        // color: this.showPassword ? Colors.blue : Colors.grey,
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          this.showPassword = !this.showPassword;
                        });
                      },
                    ),
                  ),

                ),
                RaisedButton (
                  color: Colors.deepOrange,
                  // disabledColor: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("is_login", 1);
                      Navigator.pushReplacement(
                        context,
                          MaterialPageRoute(builder: (context) => Nav(title: "Dashboard",)),
                      );
                      // }
                      _formKey.currentState.save();
                    }
                  },
                )
              ],
            ),
          )

      ),
    );
  }
}