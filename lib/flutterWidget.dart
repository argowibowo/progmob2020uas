import 'package:flutter/material.dart';

class FlutterWidget extends StatefulWidget {
  FlutterWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FlutterWidgetState createState() => _FlutterWidgetState();
}

class _FlutterWidgetState extends State<FlutterWidget> {
  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Masukan Data",
                hintText: "NIM"
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Masukan Data",
                hintText: "fafa",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),
            RaisedButton(
              color: Colors.cyanAccent,
              child: Text(
                "Simpan",
                style: TextStyle(
                  color:Colors.white,
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