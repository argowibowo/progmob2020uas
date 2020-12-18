import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/dashboardmain.dart';
import 'package:flutter/services.dart';

SharedPreferences isLogin;

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;
  bool showPassword = false;

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboardmain(title: "Dash Board Menu",)),
      );
    }
  }  @override
  void initState() {
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            height: 350,
            child: Stack(
              children:<Widget> [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('image/background.png'),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right : 20,
                  height: 105,
                  width: 110,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/tree.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
                Positioned(
                  height: 390,
                  width: 500,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/background-2.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:<Widget> [
                Text("Login", style: TextStyle(color: Color.fromRGBO(48, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30,),),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10) ,
                    color: Colors.white,
                    boxShadow:[
                      BoxShadow(
                        color: Color.fromRGBO(196, 135, 198, 1),
                        blurRadius: 20,
                        offset: Offset(0, 10)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget>[
                     Container(
                      padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                        color: Colors.grey
                        ))
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                             border:InputBorder.none,
                              hintText: "Username",
                               hintStyle: TextStyle(color:Colors.grey)
                            ),
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey
                              ))
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border:InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color:Colors.grey)
                            ),
                          ),
                        ),

                     RaisedButton (
                        child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        await pref.setInt("is_login", 1);
                        Navigator.pushReplacement(
                        context,
                            MaterialPageRoute(builder: (context) => Dashboardmain(title: "Dashboard",)));

},
                     ),],
                  ),
                )
              ],
            ),
          ),
        ]
      ),

    );
  }

}