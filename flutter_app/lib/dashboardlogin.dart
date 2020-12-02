import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/dashboardlogin.dart';
import 'package:flutter_app/pertemuan2.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences isLogin;

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;
  bool showPassword = false;

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pertemuan2(title: "Halaman Utama",)),
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
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  // seberapa besar device, akan diukur tingginya
                  height: MediaQuery.of(context).size.height / 5,
                  child: new Image.asset(
                    "images/Zefanya.png",
                  ),
                ),
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty && value.length == 0) {
                      return "Username tidak boleh kosong";
                      // } else if (!value.contains('72170122')){
                      //   return "Username Anda salah";
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
                      // } else if (!value.contains('121212')){
                      //   return "Password Anda salah";
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
                  color: Colors.blue,
                  // disabledColor: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      // // get value from textbox
                      // username = myUsernameController.text;
                      // password = myPasswordController.text;
                      // if(username != '72170122'){
                      //   return "Username anda salah";
                      // } else if(password != '101010'){
                      //   return "Password anda salah";
                      // } else {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("is_login", 1);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)),
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