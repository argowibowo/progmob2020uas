import 'package:flutter/material.dart';
import 'package:progmob_flutter_2020/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tugas8 extends StatefulWidget {
  Tugas8({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Tugas8State createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8>{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print("validated");
    }else{
      print("failed");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
/*      appBar: AppBar(
        title: Text('Tugas Pertemuan 8'),
      ),*/
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Form(
              key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                validator: (value){
                    if(value.isEmpty){
                      return "wajib di isi";
                    }
                    else{
                      return null;
                    }
                    },
                    decoration: new InputDecoration(
                      labelText: "Nama Lengkap",
                      hintText: "Nama Lengkap",
                      icon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5)
                      )
                   ),
                 ),
            RaisedButton(
              //: Colors.blue,
              color: Colors.blue,
              onPressed: validate,
              child: Text(
                "Simpan",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
                RaisedButton(
                  //: Colors.blue,
                  color: Colors.blue,
                  onPressed: ()async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_Login", 0);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter Progmob 2020 Buatan Sendiri",)),
                    );
                  },
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
          ]
        ),
      ),
      ),
      ),
    );
  }
}