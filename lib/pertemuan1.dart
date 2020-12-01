import 'package:flutter/material.dart';
import 'package:hello_world_flutter/main.dart';
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Test Input',
                    hintText: 'Teks yang akan diinput formatnya adalah sbb',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Teks Input',
                    hintText: 'Teks yang akan diinput formatnya adalah sbb',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)),
                    ),
              validator: (value){
                  if(value.isEmpty){
                    return "Nama tidak boleh kosong";
                  }
                  return null;
              },
            ),
            RaisedButton(
              child: Text(
                "SUBMIT",
                style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed:(){
                if(_formKey.currentState.validate()){}
                },
              ),
            RaisedButton(
              child: Text(
                "LOG OUT",
                style: TextStyle(color: Colors.white),
                ),
            color: Colors.blue,
            onPressed:() async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
              );;
            },
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //),
    );
  }
}