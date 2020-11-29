import 'package:flutter/material.dart';
import 'package:flutter_app_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}
class _Pertemuan8State extends State<Pertemuan8> {
  int _counter = 2;
  final  _text = TextEditingController();
  bool _validate = false;
  void dispose(){
    _text.dispose();
    super.dispose();
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  final _formKey = GlobalKey<FormState>();
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
            //TextField(),
         // mainAxisAlignment: MainAxisAlignment.start,
            TextFormField(
              //controller: _text,
              decoration: new InputDecoration(
                hintText: "contoh : Nabiya Eltarani",
                labelText: "Nama Lengkap",
                icon: Icon(
                  Icons.person,
                  size: 65,
                  ),
                border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5)),
                ),
                validator: (value) {
                if (value.isEmpty){
                return 'Nama Tidak Boleh Kosong';
                }
                return null;
                },
            ),
                  //errorText: _validate ? 'Nama tidak boleh kosong': null
            RaisedButton(
                child: Text(
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
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>HalamanLogin(title: "Hallo Push",)),
                );
            },
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      // child: Icon(Icons.add),
    ),
    );
  }
}


