import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/login.dart';
class Pertemuan8 extends StatefulWidget {

  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _Pertemuan8State();
  }
}

class _Pertemuan8State extends State<Pertemuan8> {
  String _name;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap',
          hintText: "Contoh : Brigita Monic",
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5),
          )
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nama Tidak Boleh Kosong';
        }

        return null;

      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas Pertemuan 8")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
              RaisedButton(child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
                  color: Colors.blue,
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences
                        .getInstance();
                    await pref.setInt("is_login", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login(title: "Flutter App",)),
                    );
                  }
              )],
          ),
        ),
      ),
    );
  }
}