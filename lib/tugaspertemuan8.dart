import 'package:flutter/material.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugaspertemuan8 createState() => _tugaspertemuan8();
}

class _tugaspertemuan8 extends State<tugaspertemuan8> {
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

        title: Text("Tugas Pertemuan 8"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
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
                icon: Icon(
                Icons.people,
                color:Colors.blue,
              ),
                labelText: "Nama Lengkap",
                hintText: "Contoh: David Yerusal",
                border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
                )
              ),
            ),

            RaisedButton(
              color: Colors.blue,
              onPressed: validate,
              child: Text(
                  "Simpan",
                  style: TextStyle(
                      color: Colors.white
                  )
              ),
            )
          ],
        ),
      ),
    ),
      ),

    );
  }
}
