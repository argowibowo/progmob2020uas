import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pertemuan1 extends StatefulWidget{
  Pertemuan1({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "contoh: Nadia Angelica Nugroho",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "NIM",
                  hintText: "contoh: 72180200",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
    );
  }

}