import 'package:flutter/material.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [ Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.supervisor_account_sharp,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                      labelText: "Nama Lengkap",
                      hintText: "contoh : Rico Alex Sandra",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
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