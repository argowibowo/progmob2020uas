import 'package:flutter/material.dart';

class tugas8 extends StatefulWidget {
  tugas8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugas8State createState() => _tugas8State();
}

class _tugas8State extends State<tugas8> {
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

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Padding(
              //padding: EdgeInsets.all(5.0),

           // ),

            TextFormField(
                decoration: new InputDecoration(
                    prefix: IconButton(
                      icon: Icon(Icons.supervisor_account_sharp),
                    ),
                    labelText: "Nama Lengkap",
                    hintText: "Contoh : Dio Mata",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )
                )
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color:  Colors.blue,
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

      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
