import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate(){
    if(formKey.currentState.validate()){
      print("Validated");
    }
    else{
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Pertemuan 8'),
      ),
      body: Center(
        child: Column( //hanya bisa menambahkan 1 komponen(child) column --> atas ke bawah, row --> kiri ke kanan
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
            ),
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "Nama tidak boleh kosong";
                }
                else {
                  return null;
                }
              },
              decoration: new InputDecoration(
                labelText: "Nama Lengkap",
                hintText: "contoh: Natasha Fortunata",
                icon: Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: validate,
              child: Text(
                "SUBMIT",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Halo Push 72180210',)),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
