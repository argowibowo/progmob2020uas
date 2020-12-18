import 'package:flutter/material.dart';

class uas20 extends StatefulWidget {
  uas20({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _uas20State createState() => _uas20State();
}
class _uas20State extends State<uas20> {
  final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              //TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Melsiora Saniba Fernandes",
                  labelText: "Nama Lengkap ",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Silakan isi Nama Disini';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}





