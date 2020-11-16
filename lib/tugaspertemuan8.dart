import 'package:flutter/material.dart';

class Tugaspertemuan8 extends StatefulWidget {
  Tugaspertemuan8({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Tugaspertemuan8State createState() => _Tugaspertemuan8State();
}

class _Tugaspertemuan8State extends State<Tugaspertemuan8> {
  final _formKey = GlobalKey<FormState>();

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
              // TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "contoh : Argo Uchiha",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
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