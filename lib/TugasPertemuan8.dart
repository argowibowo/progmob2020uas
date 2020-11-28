import 'package:flutter/material.dart';
import 'package:flutter_app_progmob2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  int _counter = 0;
  final _text = TextEditingController();
  bool _validate= false;

  void dispose(){
    _text.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _text,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "Nama Lengkap",
                  errorText: _validate ? 'Nama tidak boleh kosong' : null,
                  hintText: "contoh: Billianro Sember",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0)
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              color: Colors.blueAccent,
              child: Text('Login'),
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo push",)),
                );
              },
              color: Colors.blueAccent,
              child: Text('Logout'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}