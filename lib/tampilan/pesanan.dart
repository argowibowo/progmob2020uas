import 'package:flutter/material.dart';

import '../splashScreen.dart';

class Pesanan extends StatefulWidget {
  Pesanan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PesananState createState() => _PesananState();
}
class _PesananState extends State<Pesanan> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pesanan'),
    );
  }
}
