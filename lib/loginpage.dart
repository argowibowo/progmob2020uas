import 'package:flutter/material.dart';
import 'package:progmob_setelah_uts_72180190/pertemuan1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pertemuan1(title: "Home Page", nama: "Felix")),
      );
    }
  }


  @override
  void initState() {
    navigateLogin();
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Nama Tidak Boleh Kosong !!!';
    }
    return null;
  }
  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Nama Tidak Boleh Kosong !!!';
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();
  String name = '';



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      )),
                  // validator: validateUsername,
                  // onSaved: (String value) {
                  //   name = value;
                  // },
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      )),
                  // validator: validateUsername,
                  // onSaved: (String value) {
                  //   name = value;
                  // },
                ),
                RaisedButton(
                  color: Colors.cyan,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 1);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Pertemuan1(title: "Home Page", nama: "Felix",)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
