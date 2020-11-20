import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72180200/main.dart';
import 'package:flutter_72180200/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TugasPertemuan8 extends StatefulWidget{
  TugasPertemuan8({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> with Validation{
  final formKey = GlobalKey<FormState>();

  // DEFINE VARIABLE
  String namaLengkap = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey, //MENGGUNAKAN GLOBAL KEY
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15,15,15,5),
                child: TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                      labelText: "Nama Lengkap",
                      hintText: "Contoh: Nadia Angelica Nugroho",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      )
                  ),
                  validator: validateName,
                  onSaved: (String value){
                    namaLengkap = value;
                    print('Nama Lengkap : $namaLengkap');
                  },
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                disabledColor: Colors.blue,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: (){
                  if (formKey.currentState.validate()){ //JIKA TRUE
                    formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN
                  }
                },
              ),
              RaisedButton(
                color: Colors.blue,
                disabledColor: Colors.blue,
                child: Text(
                  //"Kembali",
                  "Logout",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: () async {
                  //Navigator.pop(context);
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter Demo Home Page",)),
                  );
                },
              )
            ]
          ),
        ),
      ),
    );
  }
}