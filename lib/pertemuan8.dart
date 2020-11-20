import 'package:flutter/material.dart';

class Pertemuan8 extends StatefulWidget {
  Pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan8State createState() => _Pertemuan8State();
}

class _Pertemuan8State extends State<Pertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("validated");
    } else {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Pertemuan 8'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Nama Tidak Boleh Kosong";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      icon: Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                      labelText: "Nama Lengkap",
                      hintText: "Contoh: Selvia Siregar",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: validate,
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}


