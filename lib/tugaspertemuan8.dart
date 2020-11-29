import 'package:baru1/main.dart';
import 'package:flutter/material.dart';
import 'package:baru1/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tugasPertemuan8 extends StatefulWidget {
  tugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugasPertemuan8State createState() => _tugasPertemuan8State();
}

class _tugasPertemuan8State extends State<tugasPertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate(){
    if(key.currentState.validate()){
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
              key:key,
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
                      labelText: "Nama Lengkap Anda",
                      hintText: "Contoh: Kristovera",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Password",
                      hintText: "1234",
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
                  ) ,
                       RaisedButton(
                        child: Text(
                          "Logout",
                          style: TextStyle(color : Colors.white),
                        ),
                        color:Colors.blue,
                            onPressed: () async {
                           SharedPreferences pref = await SharedPreferences.getInstance();
                           await pref.setInt("is_login",1 );
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>MyHomePage(title: "Hello Push",))
                      );
                     },
                   ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

