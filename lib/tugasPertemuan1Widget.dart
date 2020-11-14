import 'package:flutter/material.dart';
import 'package:progmob_flutter/validation.dart';

class TugasPertemuan1Widget extends StatefulWidget{
  TugasPertemuan1Widget({Key key, this.title}) :super(key:key);
  final String title;


  @override
  _TugasPertemuan1WidgetState createState()=> _TugasPertemuan1WidgetState();
}

class _TugasPertemuan1WidgetState extends State<TugasPertemuan1Widget> with Validation{
  String nama = '';
  final formKey = GlobalKey<FormState>();
  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Form(
        key : formKey,            
          child: Column( //kalo pake colomn nanti tulisannya akan kebawah
            //kalo mau ke samping, pakai ROW
              //mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Padding(
                  //jarak biar gk mepet
                  padding: EdgeInsets.all(16.0),
                ),
                //MEMBUAT TEXT INPUT
                TextFormField(
                  decoration: new InputDecoration(
                    icon: Icon(Icons.people),
                    hintText: "Nama Lengkap",
                    //MEMBUAT BORDER OUTLINE
                    border: OutlineInputBorder(
                    borderRadius : new BorderRadius.circular(5),
                    ),
                  ),
                  validator: validateNama,
                  onSaved: (String value){
                    nama = value;
                  },
                ),
                //MEMBUAT BUTTON
                RaisedButton(
                  //warna button
                    color: Colors.blue,
                    onPressed: () {
                      if(formKey.currentState.validate()){
                        formKey.currentState.save();
                      }
                    },
                    //nambahkan text pakai child (cuma bisa 1 kalo chilc, kalo banyak pake children)
                    child:
                    Text(
                      //membuat text pada button
                      "Simpan",
                      style: TextStyle(
                        //kasih warna text
                          color: Colors.white
                      ),
                    )
                )
              ]
          ),
        ),
        ),
      );
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child : Icon(Icons.add),
      ),*/
  }
}



