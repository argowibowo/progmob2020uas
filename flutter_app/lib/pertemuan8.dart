import 'package:flutter/material.dart';

class pertemuan8 extends StatefulWidget {
  pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _pertemuan8State createState() => _pertemuan8State();
}

class _pertemuan8State extends State<pertemuan8> {
  int _counter = 0;

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
                hintText: "Teks yang akan diinput formatnya adalah sbb",
              ),
            ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input 2",
                hintText: "Teks yang akan diinput yaitu",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      //child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
