import 'package:flutter/material.dart';
import 'package:flutter_app/splashscreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
  void _incrementCounter() {
    setState(() {

    });
  }

  //declare
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(5.0)
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (String val) {
                    if (val.isEmpty) {
                      return " Nama tidak boleh kosong ! ";
                    }
                  },
                  decoration: new InputDecoration(
                    icon: Icon(
                        Icons.supervisor_account_sharp
                    ),
                      labelText: "Nama Lengkap",
                      hintText: "contoh : Rico Alex Sandra",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      )
                  ),
                ),
                RaisedButton(
                  color: Colors.indigoAccent,
                  onPressed:(){
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                  },
                  child: Text("Simpan",
                    style: TextStyle(
                        color:Colors.white,
                    )
                  ),
                ),
                RaisedButton(
                  color: Colors.indigoAccent,
                  onPressed:() async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 0);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => login(title: "LOGIN")));
                  },
                  child: Text("Logout",
                      style: TextStyle(
                        color:Colors.white,
                      )
                  ),
                )
              ],
            ),
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}

class Login {
}