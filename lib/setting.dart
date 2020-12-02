import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  setting({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
