import 'package:flutter/material.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                icon: Icon(Icons.person),
                  labelText: "Nama Lengkap",
                  hintText: "Contoh: Dito Adriel",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10)
                )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("SIMPAN", style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
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