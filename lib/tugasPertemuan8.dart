import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Nama lengkap",
                hintText: "Contoh : Nikita Semben",
                icon: Icon(
                  Icons.people,
                  color: Colors.lightBlue,
                ),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              ),

              validator: (value){
                if(value.isEmpty){
                  return "Nama tidak boleh kosong";
                }else
                {
                  return null;
                }
              },
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
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
                await pref.setInt("is_login", 0);
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
