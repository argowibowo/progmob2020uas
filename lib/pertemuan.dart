import 'package:flutter/material.dart';


class Pertemuan extends StatefulWidget {
  Pertemuan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PertemuanState createState() => _PertemuanState();
}

class _PertemuanState extends State<Pertemuan> {
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
                hintText: "Teks yang akan diinput",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input 2",
                hintText: "Teks yang akan diinput",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
