import 'package:flutter/material.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _tugaspertemuan8 createState() => _tugaspertemuan8();
}

class _tugaspertemuan8 extends State<tugaspertemuan8> {
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(
                labelText: "Nama Lengkap ",
                hintText: "contoh: Melsiora Fernandes",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                       // icon: Icon(Icons.people),
        ),

                )
              ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
             decoration: new InputDecoration(
                labelText: "Nama Tidak Boleh Kosong ",
                //  hintText: "Teks Yang akan diInput Formatnya adalah sbb",


             ),
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "Submit" ,
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
