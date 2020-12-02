import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "contoh: Jeffry Caesario",
                icon: Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Nama tidak boleh kosong";
                }
                return null;
              },
            ),
            RaisedButton(
              child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
              ),
                color: Colors.blue,
                onPressed: () {
                  if (_formkey.currentState.validate()) {}
                },
              ),
              RaisedButton(
                child: Text(
                  "LOGOUT",
                  style: TextStyle(color: Colors.white),
                ),
                  color: Colors.blue,
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}