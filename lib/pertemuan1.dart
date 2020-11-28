import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes input",
                hintText: "text yang diinput format adalah sbb",
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes input 2",
                hintText: "text yang diinput format adalah sbb",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5)
                )
              ),
            ),
            RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () {

                if (_formKey.currentState.validate()){}
              },
            ),
            RaisedButton(
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Push terus",)),
                );
              },
            )

          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
