import 'package:flutter/material.dart';
class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  //int _counter = 2;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( //kalo ada tlisan child artinya cm bisa nambahin 1 komponen
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: 'Test Input',
                hintText: 'Teks yang akan diinput formatnya adalah sbb',
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              )
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: 'Test Input',
                hintText: 'Teks yang akan diinput formatnya adalah sbb',
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
              )
            ),
            RaisedButton(
              focusColor: Colors.blue,
              child: Text(
                "SAVE",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            RaisedButton(
              focusColor: Colors.blue,
              child: Text(
                "BACK",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
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