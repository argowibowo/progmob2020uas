import 'package:flutter/material.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}
class _Pertemuan8State extends State<Pertemuan8> {
  int _counter = 2;
  final  _text = TextEditingController();
  bool _validate = false;

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextFormField(
              controller: _text,
              decoration: new InputDecoration(
                icon: Icon(
                  Icons.person,
                  size: 65,
                  ),
                  labelText: "Nama Lengkap",
                  errorText: _validate ? 'Nama tidak boleh kosong': null,
                  hintText: "contoh : Nabiya Eltarani",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  ),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Submit'),
                //style: TextStyle(
                    //color: Colors.white
                ),
             // ),
           // )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      // child: Icon(Icons.add),
    );
  }
}

