import 'package:flutter/material.dart';
import 'package:flutter_progmob72170167/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
  final _formKey = GlobalKey<FormState>();
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
              children: [

            TextFormField(
              decoration: new InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan nama",
                icon: Icon(Icons.people),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              ),

            validator: (value) {
                if (value.isEmpty) {
                  return "Nama tidak boleh kosong" ;
                }
                return null;
            },
            ),
            RaisedButton(
              child: Text (
                "Submit",
                style: TextStyle(color: Colors.white),
             ),
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState.validate()) {}
            },
            ),
            RaisedButton(
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Hello Push",)),
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
