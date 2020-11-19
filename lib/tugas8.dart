import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tugas8 extends StatefulWidget {
  tugas8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugas8State createState() => _tugas8State();
}

class _tugas8State extends State<tugas8> {
  int _counter = 0;
  final _text = TextEditingController();
  bool _validate= false;

  void dispose(){
    _text.dispose();
    super.dispose();
  }

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
              controller: _text,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "Nama Lengkap",
                  errorText: _validate ? 'Nama tidak boleh kosong' : null,
                  hintText: "contoh: Elza Miyori",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0)
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              color: Colors.blueAccent,
              child: Text('simpan'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}