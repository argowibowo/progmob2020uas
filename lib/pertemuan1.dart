import 'package:flutter/material.dart';
import 'package:project_flutter_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pertemuan1 extends StatefulWidget {
  pertemuan1({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _pertemuan1State createState() => _pertemuan1State();
}

class _pertemuan1State extends State<pertemuan1> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Text Input",
                hintText: "Teks yang akan diinput formatnya adalah sbb",
              ),
            ),
            Padding(
                padding:EdgeInsets.all(16.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Text Input 2",
                hintText: "Teks yang akan diinput formatnya adalah sbb",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blue,
              child: Text(
                "Simpan",
                style:TextStyle(color: Colors.white),
              ),

                 onPressed: () {
                   if (_formKey.currentState.validate()) {}
                 },
                 ),
           RaisedButton(
            focusColor: Colors.blue,
            color: Colors.blue,
            child: Text(
             "Logout",
              style:TextStyle(color: Colors.white),
              ),
             onPressed: () async {
              SharePreferences pref = await SharedPreferences.getInstance();
               await pref.setInt("is_Login", 0);
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo Push",)),
               );
              },
           ),
          ],
        ),
      ),
    );
  }
}