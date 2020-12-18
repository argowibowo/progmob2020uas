import 'package:flutter/material.dart';
import 'package:andre_fapp/main.dart';
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
        MaterialPageRoute(builder: (context) => MyApp(title: "Halaman Utama",)),
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
        backgroundColor: Colors.blue[700],
      ),
      backgroundColor: Colors.white,
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 5,
                  child: new Image.asset(
                    "images/baostudio.png",
                  ),
                ),
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty && value.length == 0) {
                      return "Username tidak boleh kosong";
                    } else if (!value.contains('72180187')){
                      return "Username atau password";
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
                    } else if (!value.contains('72180187')){
                      return "Username atau password";
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
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("is_login", 1);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(title: "Dashboard",)),
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