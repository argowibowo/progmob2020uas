import 'package:flutter/material.dart';
class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Test Input',
                    hintText: 'Teks yang akan diinput formatnya adalah sbb',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Test Input',
                    hintText: 'Teks yang akan diinput formatnya adalah sbb',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )
                )
            ),
            RaisedButton(
              focusColor: Colors.blue,
              child: Text(
                "SIMPAN",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
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