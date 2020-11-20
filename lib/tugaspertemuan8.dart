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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: "Nama Lengkap",
                      hintText: "Contoh: Anisya Clara",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5),
                      )
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                }
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("OK")));
                  }
                },
              ),
            ],
          )


      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //  ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
