import 'package:flutter/material.dart';
import 'package:flutter_progmob_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../splashScreen.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile'),
    );
  }
}
class Log extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Menu'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: null)
        ],
      ),
      body: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      ""
                  )
              )
          ),
        ),
        title: Text(
          'Modesta Oki',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            RaisedButton.icon(
                icon: Icon(Icons.album),
                label: Text('@gmail.com'),
                color: Colors.grey[200],
                elevation: 0.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)
                ),
                onPressed: (){}
            ),
            Padding(padding: EdgeInsets.all(5.0),),
            RaisedButton(
                child: Text('72180208'),
                color: Colors.grey[200],
                elevation: 0.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)
                ),
                onPressed: (){}),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            RaisedButton(
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>MyHomePage(title: "Push aja",)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: Text('Login', style: TextStyle(
                        fontSize: 24,
                        color: Colors.white
                    ),),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}