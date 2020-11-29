import 'package:flutter/material.dart';
import 'package:flutter_app_72180256/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TugasPertemuan08 extends StatefulWidget {
  TugasPertemuan08({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _TugasPertemuan08State createState() => _TugasPertemuan08State();
}

class _TugasPertemuan08State extends State<TugasPertemuan08> {
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
        title: Text('Tugas Pertemuan 8 Hakkel'),
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
                      hintText: "Contoh: Hakkel Hutabarat",
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
                          color: Colors.lightGreenAccent
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
                        MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo Yok DI push Bund",)),
                      );
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.lightGreenAccent
                      ),

                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}