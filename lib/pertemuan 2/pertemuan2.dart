import 'package:flutter/material.dart';
import 'package:flutter_72180247/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pertemuan2 extends StatefulWidget{
  Pertemuan2({Key key, this.title}):super(key:key);
  final String title;

  @override
  _Pertemuan2 createState() => _Pertemuan2();
}

class _Pertemuan2 extends State<Pertemuan2>{
  int _counter =2;

  void _incrementCounter(){
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
                  labelText: "Test Input",
                  hintText: "Teks yang akan diinput formatnya adalah sbb",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Test Input 2",
                  hintText: "Teks yang akan diinput formatnya adalah sbb",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Log Out",
                style: TextStyle(
                    color: Colors.white,
                ),
              ),
              onPressed: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo Push",)),
                );
              },
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}