import 'package:flutter/material.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate(){
    if (key.currentState.validate()){
      print("Berhasil");
    }
    else {
      print ("Gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding:EdgeInsets.all(15.0),
        child: Center(
          child : Form(
            key : key,
            child : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator : (value){
                    if(value.isEmpty){
                      return "Nama Tidak Boleh Kosong";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: new InputDecoration(
                    icon : Icon (
                      Icons.attach_email,
                      color: Colors.pink,
                    ),
                    labelText: 'Nama Lengkap',
                    hintText: 'Contoh : Brillianty Chlara Ambrelly ',
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(3),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: validate,
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      //child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}