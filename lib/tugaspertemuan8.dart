import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, Container, EdgeInsets, Form, FormState, GlobalKey, InputDecoration, MainAxisAlignment, RaisedButton, Scaffold, SizedBox, State, StatefulWidget, Text, TextFormField, TextStyle, Widget;

class FormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormScreenState();
      }
      
    }
    
    class FormScreenState extends State<FormScreen>{
      String nama;

      final GlobalKey<FormState> formkey = GlobalKey<FormState>();

      Widget buildNama(){
        return TextFormField(
          decoration: InputDecoration(labelText: 'Nama'),
          validator: (String value){
            if(value.isEmpty){
              return 'Silahkan masukkan nama';
            }
          },
          onSaved: (String value){
            nama = value;
          },
        );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas Pertemuan 8")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildNama(),
            SizedBox(height: 100),
            RaisedButton(
              child: Text(
                'submit',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            onPressed: () {
              if(!formkey.currentState.validate()){
                  return;
              }
              formkey.currentState.save();

              print(nama);
            },
            )
          ],
        ),),
      ),
    );
    

  }

    }
