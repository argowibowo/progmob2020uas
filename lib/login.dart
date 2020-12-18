import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';
import 'package:flutter_app/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apiservices.dart';
import 'dashboardMain.dart';

class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  LoginDashboard masukDashboard = new LoginDashboard();
  TextEditingController inputnim = TextEditingController();
  TextEditingController inputpass = TextEditingController();


  @override
  void initState() {
    navigateLogin();
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Dashboard(title: "Main Dashboard", nimnik: inputnim.text,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5.0)
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: inputnim,
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
                onSaved: (String value){
                  this.masukDashboard.nimnik = value;
                },
              ),
              Padding(
                  padding: EdgeInsets.all(5.0)
              ),
              TextFormField(
                controller: inputpass,
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
                onSaved: (String value){
                  this.masukDashboard.password = value;
                },
                obscureText: true
              ),
              RaisedButton(
                color: Colors.indigoAccent,
                child: Text("Login",
                    style: TextStyle(
                      color:Colors.white,
                    )
                ),
                onPressed:() async {
                  if(_formState.currentState.validate()){
                    if(inputnim.text != "72160000" || inputpass.text !="progmob"){
                      return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                                content: Text("NIM atau Password Salah"));
                          });
                    } else {
                      LoginDashboard.reqAPI(inputnim.text,inputpass.text).then((value) async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        await pref.setInt("is_login", 1);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(title: "Main Dashboard", nimnik: inputnim.text)));
                      });
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}