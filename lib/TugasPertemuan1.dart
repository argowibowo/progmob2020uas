import 'package:flutter/material.dart';


class Tgspertemuan1 extends StatefulWidget {
  Tgspertemuan1({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  _Tgspertemuan1State createState() => _Tgspertemuan1State();
}

class _Tgspertemuan1State extends State<Tgspertemuan1> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("validated");
    }else{
      print("failed");
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Pertemuan 1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
            child:Form(
              key:formkey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "tidak boleh kosong";
                    }else{
                      return null;
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Nama Lengkap",
                      hintText: "Nama Lengkap",
                      icon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5)
                      )
                  ),
                ),
                RaisedButton(
                    color: Colors.blue,
                    onPressed:validate,
                    child:Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}