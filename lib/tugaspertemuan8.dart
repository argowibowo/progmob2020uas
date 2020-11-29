import 'package:flutter/material.dart';
import 'package:flutter_app_2020/login.dart';
import 'package:flutter_app_2020/main.dart';
import 'package:flutter_app_2020/splashscreen.dart';
import "package:shared_preferences/shared_preferences.dart";

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
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
      appBar: AppBar(
        title: Text('Tugas Pertemuan 8'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child:Center(
            child:Form(
              key:formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Nama Tidak Boleh Kosong";
                      }else{
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                      icon:Icon(
                        Icons.people,
                        color:  Colors.blue,
                      ),
                      labelText: "Nama Lengkap",
                      hintText: "Contoh: Riswan S. Tritama",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed:validate,
                    child: Text(
                      "Simpan",
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
                        MaterialPageRoute(builder: (context) => Login(title: "Halo Push")),
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
            )
        ),
      ),
    );
  }
}