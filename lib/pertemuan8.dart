import 'package:flutter/material.dart';
import 'package:flutter_selvia/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("validated");
    } else {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 8'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Nama Tidak Boleh Kosong";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      icon: Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                      labelText: "Nama Lengkap",
                      hintText: "Contoh: Selvia Siregar",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  RaisedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        if (key.currentState.validate()) {}
                        //currentState.validate()) {}}
                      }
                        ),
                  RaisedButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        //SharedPreferences pref = await SharedPreferences.getInstance();
                        await pref.setInt("is_login",0);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(title : "Hallo Push",)),
                        );
                      }
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

