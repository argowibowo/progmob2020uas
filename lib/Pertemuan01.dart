import 'package:flutter/material.dart';

//72180256
class Pertemuan01 extends StatefulWidget {
  Pertemuan01({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _Pertemuan01State createState() => _Pertemuan01State();
}

class _Pertemuan01State extends State<Pertemuan01> {
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {

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