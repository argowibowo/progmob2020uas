import 'package:flutter/material.dart';

class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Teks Input",
                hintText: "Teks yang akan diimput formatnya adalah sbb",

              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
                decoration: new InputDecoration(
                  labelText: "Teks Input 2",
                  hintText: "Teks yang akan diimput formatnya adalah sbb",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                  )
                ),
            ),
            RaisedButton(
              color : Colors.blue,
              child: Text( 
                "Simpan",
                style : TextStyle(
                  color : Colors.white
                )
              )
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
