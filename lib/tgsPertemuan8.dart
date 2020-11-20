import 'package:flutter/material.dart';

class tgsPertemuan8 extends StatefulWidget {
  tgsPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tgsPertemuan8State createState() => _tgsPertemuan8State();
}

class _tgsPertemuan8State extends State<tgsPertemuan8> {
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
                      hintText: "Contoh: Elsa",
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
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}