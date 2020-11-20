import 'package:flutter/material.dart';
class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
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
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "Nama tidak boleh kosong";
                }else
                {
                  return null;
                }
              },
              decoration: new InputDecoration(
                icon: Icon(
                  Icons.people,
                  color: Colors.lightBlue,
                ),
                labelText: "Nama Lengkap",
                hintText: "Contoh Adrian Yunas Wicaksono",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )

          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}