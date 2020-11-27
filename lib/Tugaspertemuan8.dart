import 'package:flutter/material.dart';
import 'package:flutter_72180247/pertemuan%202/login.dart';

class Tugaspertemuan8 extends StatefulWidget{
  Tugaspertemuan8({Key key, this.title}):super(key:key);
  final String title;

  @override
  _Tugaspertemuan8 createState() => _Tugaspertemuan8();
}

class _Tugaspertemuan8 extends State<Tugaspertemuan8> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("PROGMOB!?!?"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage()),
                        (Route<dynamic> route) => false);
              })
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // TextField(),
                TextFormField(
                  decoration: new InputDecoration(
                    hintText: "contoh: Christyanson",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}