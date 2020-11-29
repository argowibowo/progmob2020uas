import 'package:flutter/material.dart';
import 'package:progmob_flutter/main.dart';
import 'package:progmob_flutter/tugaspertemuan8.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  String nama = "Anisya";
  String password = "nisya123";
  String alert = "Login";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController namaInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  void prosesLogin() {
    if(_formKey.currentState.validate()){
      if(namaInput.text == nama && passwordInput.text == password){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => TugasPertemuan8(title: "HALLO")
        ));
      }
      else{
        setState((){
          alert = "Nama atau Password salah";
        });

      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(Icons.people, size:40, color: Colors.white),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              Text("Hallo", style: TextStyle(fontSize: 20, color: Colors.blue)),

              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              Text(alert),

              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              TextFormField(
                controller: namaInput,
                validator: (value){
                  if(value.isEmpty){
                    return "Masukkan nama dengan benar";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    prefixIcon: Icon(Icons.people, size: 40),
                    hintText: "Masukkan Nama",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.black)
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: passwordInput,
                        validator: (value){
                          if(value.isEmpty){
                            return "Masukkan password dengan benar";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            prefixIcon: Icon(Icons.lock, size: 40),
                            hintText: "Masukkan Password",
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black)
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),

                      Card(
                          color: Colors.blue,
                          elevation: 5,
                          child: Container(
                              height: 50,
                              child: InkWell(
                                  splashColor: Colors.lightBlueAccent,
                                  onTap : () => prosesLogin(),
                                  child: Center(
                                    child: Text("LOGIN", style: TextStyle(fontSize: 20, color: Colors.black),),
                                  )
                              )
                          )
                      )
                    ],
                  )
              )
            ],
          )
      ),

      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'Increment',
      //child: Icon(Icons.add),
      //  ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
