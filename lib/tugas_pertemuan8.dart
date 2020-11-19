import 'package:flutter/material.dart';

class tugas_pertemuan8 extends StatefulWidget {
  tugas_pertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugas_pertemuan8State createState() => _tugas_pertemuan8State();
}

class _tugas_pertemuan8State extends State<tugas_pertemuan8> {
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
        title: Text('Tugas Flutter Widget'),
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
                      hintText: "Contoh: Yohana Thalia",
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