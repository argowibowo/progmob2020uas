import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_72160025/dashboard.dart';
import 'package:flutter_72160025/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addDosen extends StatefulWidget {
  addDosen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _addDosenState createState() => _addDosenState();
}

class _addDosenState extends State<addDosen>{
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate(){
    if(key.currentState.validate()){
      print("Validated");
    }else{
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("add Dosen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Nama Tidak Diperbolehkan Kosong";
                    }else{
                      return null;
                    }
                  },
                  decoration: new InputDecoration(
                    icon: Icon(
                      Icons.people,
                      color: Colors.deepOrange,
                    ),
                    labelText: "Nama Lengkap",
                    hintText: "Contoh: Brian Eldrin Sombuk",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(3),
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.red,
                    onPressed: validate,
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                ),
                RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dashboard(title: "Dashboard",)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}