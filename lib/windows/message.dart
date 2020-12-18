import 'package:flutter/material.dart';
import '../splashScreen.dart';

class Message extends StatefulWidget {
  Message({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MessageState createState() => _MessageState();
}
class _MessageState extends State<Message> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Message'),
    );
  }
}