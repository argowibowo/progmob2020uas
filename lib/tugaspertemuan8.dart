import 'package:flutter/material.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
  }

class _TugasPertemuan8State extends State<TugasPertemuan8> {
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
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Makanan Kesukaan",
                hintText: "Nasi Goreng, Mie Goreng, Ayam Geprek",
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Minuman Kesukaan",
                  hintText: "Jus Orange, Jus Mangga, Jus Pisang",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
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
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //),
    );
  }
}