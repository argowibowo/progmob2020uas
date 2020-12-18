
import 'package:flutter/material.dart';
import 'package:flutter_progmob72170109/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class uasprogmob extends StatefulWidget {
  uasprogmob({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _uasprogmobState createState() => _uasprogmobState();
}
class _uasprogmobState extends State<uasprogmob> {
  final _formKey = GlobalKey<FormState>();
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    //return Text("Splash Screen");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
          //TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Melsiora Saniba Fernandes",
                  labelText: "Nama Lengkap ",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),

          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Silakan Isi Nama Disini';
            }
            return null;
          },
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.cyan,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
              RaisedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.cyan,
                onPressed: ()  async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: "Hallo Push",)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  }





