import 'package:flutter/material.dart';
import 'package:flutter_72160025/pertemuan1.dart';

class Tugaspertemuan8 extends StatefulWidget {
  Tugaspertemuan8({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Tugaspertemuan8State createState() => _Tugaspertemuan8State();
}

class _Tugaspertemuan8State extends State<Tugaspertemuan8> {
  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Tidak Boleh Kosong !!!';
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),
              TextFormField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "Nama Lengkap",
                    hintText: "Contoh: Brian Eldrin Sombuk",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )),
                validator: validateName,
                onSaved: (String value) {
                  name = value;
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pertemuan1(title: "Home Page", nama: name,)),
                    );
                  }
                  else {
                    formKey.currentState.save();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}