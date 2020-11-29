import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
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
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Tes Input",
                  hintText: "Teks yang akan diinput formatnya adalah sbb"
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),

            ),

            TextFormField(
                decoration: new InputDecoration(
                    labelText: "Tes Input 2",
                    hintText: "Teks yang akan diinput formatnya adalah sbb",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )
                )
            ),
            RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.white,
              onPressed: (){
                if (_formKey.currentState.validate()){}
              },
            ),
            RaisedButton(
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Hallo Push',)),
                );
              },
            )
          ],
        ),
      ),

      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

