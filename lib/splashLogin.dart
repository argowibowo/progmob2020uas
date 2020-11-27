import 'package:flutter/material.dart';
import 'package:progmob2020_flutter/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashLogin extends StatefulWidget {
  SplashLogin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashLoginState createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {

  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username, password;

  final formKey = GlobalKey<FormState>();
  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomePage();
        }),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
      body: Center(
        child: Column( //hanya bisa menambahkan 1 komponen(child) column --> atas ke bawah, row --> kiri ke kanan
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextFormField(
              //cekdata field kosong
              validator: (value){
                if(value.isEmpty){
                  return 'Please Input Username';
                }
                return null;
              },
              controller: myUsernameController,
              decoration: new InputDecoration(
                labelText: "Username",
                hintText: "contoh: 72180210",
                icon: Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              //cekdata field kosong
              validator: (value){
                if(value.isEmpty){
                  return 'Please Input Username';
                }
                return null;
              },
              maxLength: 20,
              maxLengthEnforced: true,
              controller: myPasswordController,
              obscureText: true,
              decoration: new InputDecoration(
                  labelText: "Password",
                  hintText: "Input Password",
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
            ),
            ),
              RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                "SUBMIT",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
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