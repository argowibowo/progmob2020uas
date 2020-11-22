import 'dart:ui';

import 'package:flutter/material.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  // final _formKey = GlobalKey<FormState>();
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        // key: _formKey,
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                // new Container(
                //   padding: EdgeInsets.all(10.0),
                //   // child: new Image.asset('images/blue-person.png', width: 40.0, height: 40.0),
                //   width: 20,
                //   height: 20,
                //   child: new Icon(Icons.person),
                // ),
                new Expanded(
                  child: new Container(
                    padding: EdgeInsets.all(14.0),
                    child: new TextFormField(
                      controller: _text,
                      decoration: new InputDecoration(
                        icon: Icon(Icons.people),
                        labelText: "Nama Lengkap",
                        hintText: "contoh: Magdalena Evelyn Halim",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        // labelText: 'Enter the Value',
                        errorText: _validate ? 'Nama tidak boleh kosong' : null,
                      ),
                      // validator: (value){
                      //   if(value.isEmpty){
                      //     return "Nama tidak boleh kosong";
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                ),
              ],
            ),
            new RaisedButton(
              // onPressed: (){
              //     if(_formKey.currentState.validate()){
              //
              //     }
              //   },
              onPressed: () {
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              color: Colors.blue,
              // disabledColor: Colors.blue,
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}