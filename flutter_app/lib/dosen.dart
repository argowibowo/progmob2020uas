import 'package:flutter/material.dart';

class dosen extends StatefulWidget {
  dosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _dosenState createState() => _dosenState();
}

class _dosenState extends State<dosen> {
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
                labelText: "Tes Input",
                hintText: "text yang akan diinput formatnya adalah ",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Tes Input 2",
                  hintText: "text yang akan diinput formatnya adalah ",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            RaisedButton(
              focusColor: Colors.blue ,
              color: Colors.blue ,
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue ,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue ,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //  ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}