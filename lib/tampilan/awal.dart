import 'package:flutter/material.dart';

import '../splashScreen.dart';

class Awal extends StatefulWidget {
  Awal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AwalState createState() => _AwalState();
}
class _AwalState extends State<Awal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Awal'),
    );
  }
}
