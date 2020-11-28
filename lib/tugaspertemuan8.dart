import 'package:flutter/material.dart';


class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

final String title;

@override
_tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
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

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            new Icon(Icons.android, color: Colors.red[900], size: 40.0),
            TextFormField(


              decoration: new InputDecoration(

                  labelText: "Nama Lengkap",
                  hintText: "contoh: Morgan Haloho",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.only(topRight:Radius.circular(12)),
                  )
              ),
            ),
            RaisedButton(
              color: Colors.transparent,
              splashColor: Colors.blue,
              onPressed: null,
              child: Text("Simpan",
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
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

