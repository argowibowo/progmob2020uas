import 'package:flutter/material.dart';

import '../splashScreen.dart';

class Simpan extends StatefulWidget {
  Simpan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SimpanState createState() => _SimpanState();
}
class _SimpanState extends State<Simpan> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Simpan'),
    );
  }
}
