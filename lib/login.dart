import 'package:flutter/material.dart';
import 'package:flutter_app/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboardMain.dart';

class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    navigateLogin();
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("isLogin");
    if(isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Dashboard(title: "Login")));
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
                child: Text("Login",
                    style: TextStyle(
                      color:Colors.white,
                    )
                ),
                onPressed:() async {
                  //if(!_formKey.currentState.validate()){
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setInt("is_login", 1);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Dashboard(title: "Main Dashboard")));
                  //}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}