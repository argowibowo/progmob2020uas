import 'dart:ui';

import 'package:flutter/material.dart';

class TugasPertemuan8Cara_Argo extends StatefulWidget {
  TugasPertemuan8Cara_Argo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TugasPertemuan8Cara_ArgoState createState() => _TugasPertemuan8Cara_ArgoState();
}

class _TugasPertemuan8Cara_ArgoState extends State<TugasPertemuan8Cara_Argo> {
  //=================CARA PAK ARGO======================
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // =================CARA PAK ARGO======================
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value){
                    if(value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.people),
                    labelText: "Nama Lengkap",
                    hintText: "contoh: Argo Uchiha",
                    border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                    ),
                  ),
                ),
                RaisedButton(
                    onPressed: (){
                        if(_formKey.currentState.validate()){}
                    },
                  color: Colors.blue,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
        ),
      )
      // =================CARA PAK ARGO======================
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}