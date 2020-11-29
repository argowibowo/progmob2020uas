import 'package:flutter/material.dart';
import 'package:flutter_app_1/HalamanLogin.dart';
import 'package:flutter_app_1/pertemuan1.dart';
import 'package:flutter_app_1/tugaspertemuan8.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_1/SplashScreen.dart';

void main() {
  runApp(MyApp());
}
const String_title = 'Hello World';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  ',
      theme: ThemeData(

        primarySwatch: Colors.pink,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HalamanLogin(title: 'SplashScreen'),
    );
  }
}
//class MyHomePage extends StatefulWidget {
 //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;
 // @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//class _MyHomePageState extends State<MyHomePage> {


  // int _counter = 0;

  ////void _incrementCounter() {
  // setState(() {

  //_counter++;
  // });

class HalamanLogin extends StatefulWidget {
  @override
  HalamanLogin({Key key, this.title}) : super(key: key);
  final String title;
  _HalamanLoginState createState() => _HalamanLoginState();
  }
  class _HalamanLoginState extends State<HalamanLogin> {
  final _formKey = GlobalKey<FormState>();
  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int isLogin = pref.getInt("is_login");
    if(isLogin == 1){
     Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) =>Pertemuan8(title: "Hallo Push",)),
      );
    }
  }
  @override
  void initState() {
    navigateLogin();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.all(8),
      color: Colors.pink,
      child: Column(
        children: <Widget>[
         Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle
          ),
          child: Center(
            child: Icon(Icons.person, size: 50, color: Colors.white,),
          ),
          ),
          SizedBox(height: 20,),

          Text("Selamat Datang , Silahkan Masuk", style: TextStyle(fontSize: 20, color: Colors.black87),),

          SizedBox(height: 20,),

          TextFormField(
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)
            ),
            prefixIcon: Icon(Icons.person, size: 40,),
            hintText: "Masukkan Nama",
            hintStyle: TextStyle(color: Colors.black87),
            labelText: "Nama",
            labelStyle: TextStyle(color: Colors.black87),
            ),
            ),
          SizedBox(height: 20,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)
             ),
              prefixIcon: Icon(Icons.person, size: 40,),
              hintText: "Masukkan Password",
              hintStyle: TextStyle(color: Colors.black87),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black87),
              ),
              ),
          SizedBox(height: 20,),
      RaisedButton(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.black87,
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setInt("is_login", 1);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>Pertemuan8(title: "Hallo Push",)),
          );
        },
      ),
      ],
    ),
  ),
    );

          //Card(
            //color: Colors.black87,
            //elevation: 5,
            //child: Container(
             // height: 50,
              //child: InkWell(
               // splashColor: Colors.white,
               // onTap: (){},
               /// child: Center(
                  //child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),
                 // ),
                   // onPressed:  () async{
                    //SharedPreferences pref = await SharedPreferences.getInstance();
                   // await pref.setInt("is_login", 1);
                    //Navigator.pushReplacement(
                    //context,
                    //MaterialPageRoute(builder: (context) =>Pertemuan8(title: "Hallo Push",)),
                   // );
                 // },

          //),
       // )
       // ],
     // ),
    //),
  ///);
  }
  }


 // @override
  //idget build(BuildContext context) {
    //return Scaffold(
      //appBar: AppBar(
        //title: Text(widget.title),
      //),
    //body: Center(
        //child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Text(
              //'You have pushed the button this many times:',
            //),
            //Text(
              //'$_counter',
              //style: Theme.of(context).textTheme.headline4,
            //),
            //RaisedButton(
             //child: Text(
               //'Login'
              //),
              //onPressed:  () async{
              // SharedPreferences pref = await SharedPreferences.getInstance();
               // await pref.setInt("is_login", 1);
               // Navigator.pushReplacement(
                 // context,
                // MaterialPageRoute(builder: (context) =>HalamanLogin(title: "Hallo Push",)),
               // );
             // }
           // )
         // ],
       // ),
    //  ),
     // floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
       // tooltip: 'Increment',
        //child: Icon(Icons.add),
     // ), // This trailing comma makes auto-formatting nicer for build methods.
   // );
 // }
//}
