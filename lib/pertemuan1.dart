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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes input",
                hintText: "teks yang mau diinput",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextFormField(
            decoration: new InputDecoration(
              labelText: "Tes input 2",
              hintText: "teks yang mau diinput",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5)
                )
            ),
           ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "SIMPAN",
                    style : TextStyle(
                      color: Colors.white

                    )
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
