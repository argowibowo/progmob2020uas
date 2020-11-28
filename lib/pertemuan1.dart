import 'package:flutter/material.dart';
import 'package:flutter_progmob_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Pertemuan1 extends StatefulWidget {
  Pertemuan1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertemuan1State createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
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
         children:[
            TextFormField(
              decoration: new InputDecoration(
                labelText: "Tes Input",
                hintText: "Teks Input Format sbb",
                icon: Icon(Icons.people,),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
          ),
          validator: (value){
                if (value.isEmpty){
                  return" Nama Tidak Boleh Kosong";
                }
                return null;
          },
        ),
            RaisedButton(
              child: Text("Submit",
              style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: (){
                if(_formKey.currentState.validate()){}
              },
            ),

           RaisedButton(
             child: Text("Logout",
               style: TextStyle(color: Colors.white),
             ),
             color: Colors.blue,
             onPressed: () async {
               SharedPreferences pref = await SharedPreferences.getInstance();
               await pref.setInt('is_login', 0);
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => MyHomePage(title: "72180263",)),
               );
             },
           ),
          ],
        ),
      ),
      ),
    );
  }
}
