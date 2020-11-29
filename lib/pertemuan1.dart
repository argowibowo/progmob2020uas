import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}
class Pertmn1 extends StatefulWidget {
  Pertmn1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pertmn1State createState() => _Pertmn1State();
}

class _Pertmn1State extends State<Pertmn1> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          TextFormField(
        decoration: new InputDecoration(
          labelText: "Teks Input",
          hintText: "TeKS YANG akan DiiNPUT fORMAtnya SbB",
          ),
          ),
           Padding(
             padding: EdgeInsets.all(5.0),
           ),
           TextFormField(
             decoration: new InputDecoration(
                 labelText: "Teks Input",
                 hintText: "TeKS YANG akan DiiNPUT fORMAtnya SbB",
                 border: OutlineInputBorder(
                   borderRadius: new BorderRadius.circular(5),
                 )
             ),
           ),
            RaisedButton(
              color: Colors.blue,
             child: Text(
              "Simpan",
               style: TextStyle(
                 color: Colors.white),
                ),
            onPressed: () {
              //if (_formKey.currentState.validate()) {}
                },
             ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white),
                   ),
                    onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is login", 1);
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
            );
            },
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



