import 'package:flutter/material.dart';
import 'package:flutter_app/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  //declare
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5.0)
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (String val) {
                  if (val.isEmpty) {
                    return " Username tidak boleh kosong ! ";
                  }
                },
                decoration: new InputDecoration(
                    labelText: "Username",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  icon: Icon(
                      Icons.supervisor_account_rounded
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0)
              ),
              TextFormField(
                validator: (String val) {
                  if (val.isEmpty) {
                    return " Password tidak boleh kosong ! ";
                  }
                },
                decoration: new InputDecoration(
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  icon: Icon(
                      Icons.lock_outline_rounded
                  ),
                ),
                obscureText: true,
              ),
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed:() async {
                  //if(!_formKey.currentState.validate()){
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 1);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => tugaspertemuan8(title: "TUGAS PERTEMUAN 1 ")));
                  //}
                },
                child: Text("Login",
                    style: TextStyle(
                      color:Colors.white,
                    )
                ),
              )
            ],
          ),
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}