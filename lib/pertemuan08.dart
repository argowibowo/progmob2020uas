import 'package:flutter/material.dart';


class pertemuan08 extends StatefulWidget {
  pertemuan08({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _pertemuan08State createState() => _pertemuan08State();
}

class _pertemuan08State extends State<pertemuan08> {
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
                labelText: "Text Input",
                hintText: "Ini Tugas Peremuan 08",
              ),
            ),
            Padding(
              padding:EdgeInsets.all(16.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Text Input 2",
                  hintText: "Ini Tugas Pertemuan 08",
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
                style:TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}