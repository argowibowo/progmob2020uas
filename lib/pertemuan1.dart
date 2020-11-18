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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input 1",
                hintText: "Teks yang akan diinput formatnya adalah sbb",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input 2",
                hintText: "Teks yang akan diinput formatnya adalah sbb",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}