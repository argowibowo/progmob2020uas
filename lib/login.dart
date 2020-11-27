import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  final String title;
  login({Key key, this.title}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Username tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                  decoration: new InputDecoration(
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.blue
                    ),
                    labelText: "Username",
                    hintText: "contoh: kerenkezia12"
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else {
                      if(value.length < 6) {
                        return "Password tidak boleh kurang dari 6 karakter.";
                      } else {
                        return null;
                      }
                    }
                  },
                  decoration: new InputDecoration(
                      icon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue
                      ),
                      labelText: "Password",
                      hintText: "contoh: terserah"
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}