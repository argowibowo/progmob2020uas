import 'package:flutter/material.dart';

class pertemuan8 extends StatefulWidget {
  pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _pertemuan8State createState() => _pertemuan8State();
}

class _pertemuan8State extends State<pertemuan8> {
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
        title: Text("pertemuan 8"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input",
                hintText: "text yang akan diinput formatnya adalah ",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Tes Input 2",
                  hintText: "text yang akan diinput formatnya adalah ",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            RaisedButton(
              focusColor: Colors.yellow ,
              color: Colors.yellow ,
              child: Text(
                "Simpan",
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //  ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}