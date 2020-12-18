import 'package:flutter/material.dart';
import '../splashScreen.dart';

class Save extends StatefulWidget {
  Save({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SaveState createState() => _SaveState();
}
class _SaveState extends State<Save> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Save'),
    );
  }
}