import 'package:flutter/material.dart';
class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
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
                labelText: "Nama lengkap",
                hintText: "Contoh : Nikita Semben",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5)
                )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5.0)
            ),

            RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white),
              ),
              color: Colors.lightBlue,
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
