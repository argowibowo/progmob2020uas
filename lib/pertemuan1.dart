import 'package:flutter/material.dart';

class pertemuan1 extends StatefulWidget {
  pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _pertemuan1State createState() => _pertemuan1State();
}

class _pertemuan1State extends State<pertemuan1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    /*Text(
              //'$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
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
            RaisedButton(
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
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}