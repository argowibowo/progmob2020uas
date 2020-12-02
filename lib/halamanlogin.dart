
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanLogin extends StatefulWidget {
  HalamanLogin({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final _formKey = GlobalKey<FormState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;
  bool showPassword = false;

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(title: "Home",)),
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
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.pink,
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.person, size: 50, color: Colors.white,),
              ),
            ),
            SizedBox(height: 20,),

            Text("Selamat Datang , Silahkan Masuk", style: TextStyle(fontSize: 20, color: Colors.black87),),

            SizedBox(height: 20,),

            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)
                ),
                prefixIcon: Icon(Icons.person, size: 40,),
                hintText: "Masukkan Nama",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Nama",
                labelStyle: TextStyle(color: Colors.black87),
              ),
              validator: (value) {
                if (value.isEmpty){
                  return 'Nama Tidak Boleh Kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)
                ),
                prefixIcon: Icon(Icons.person, size: 40,),
                hintText: "Masukkan Password",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black87),
              ),
              validator: (value) {
                if (value.isEmpty){
                  return 'Password Tidak Boleh Kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black87,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>Dashboard(title: "Hallo Push",)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}