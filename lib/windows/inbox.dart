import 'package:flutter/material.dart';
import '../splashScreen.dart';

class Inbox extends StatefulWidget {
  Inbox({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InboxState createState() => _InboxState();
}
class _InboxState extends State<Inbox> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Inbox'),
    );
  }
}