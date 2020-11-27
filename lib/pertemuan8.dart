import 'package:flutter/material.dart';

class pertemuan8 extends StatefulWidget {
  pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _pertemuan8State createState() => _pertemuan8State();
}

class _pertemuan8State extends State<pertemuan8> {
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
              decoration:  new InputDecoration(
                  labelText: "Test Input Data",
                  hintText: "Inputkan Teks Anda",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration:  new InputDecoration(
                  labelText: "Test Input Data",
                  hintText: "Inputkan Teks Anda",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}