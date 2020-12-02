import 'package:flutter/material.dart';
import 'package:progmob_flutter/dashboard.dart';
import 'package:progmob_flutter/main.dart';
import 'package:progmob_flutter/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(title: "Hallo",)),
      );
    }
  }

  @override
  void initState(){
    navigateLogin();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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

            RaisedButton(
                child: Text(
                    'Login'
                ),
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login",1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard(title: "Dashboard",)),
                  );
                }
            )
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
