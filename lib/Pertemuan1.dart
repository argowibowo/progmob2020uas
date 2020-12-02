import 'package:flutter/material.dart';

class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _Pertemuan1 createState() => _Pertemuan1();
}

class _Pertemuan1 extends State<Pertemuan1> {
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
            TextField(
              decoration: new InputDecoration(
                labelText: "Tes Input ",
                hintText: "Teks Yang akan diInput Formatnya adalah sbb",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              decoration: new InputDecoration(
                  labelText: "Tes Input 2 ",
                  hintText: "Teks Yang akan diInput Formatnya adalah sbb",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Simpan" ,
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
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
