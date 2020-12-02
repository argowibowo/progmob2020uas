import 'package:flutter/material.dart';
import 'package:flutter72180249/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardMatkul extends StatefulWidget {
DashboardMatkul({Key key, this.title}) : super(key: key);
final String title;

@override
_DashboardMatkulState createState() => _DashboardMatkulState();
}

class _DashboardMatkulState extends State<DashboardMatkul> {
final _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(widget.title),
actions: <Widget>[
IconButton(
icon: Icon(Icons.add),
onPressed: (){},
)
],
),
body: Container(
child: GestureDetector(
child: Card(
child: Column(
mainAxisSize: MainAxisSize.min,
children: <Widget> [
ListTile(
leading: Icon(Icons.book),
title: Text("Pemrograman Mobile"),
subtitle: Text("SI3333"),
trailing: PopupMenuButton(
itemBuilder: (_) => <PopupMenuItem<String>>[
new PopupMenuItem<String>(
child: const Text('Update'), value: 'Up'),
new PopupMenuItem<String>(
child: const Text('Delete'), value: 'Del',
)
],
),
)
],
)
),
)
),
);

}
}