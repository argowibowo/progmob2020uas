import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jadwal extends StatefulWidget {
  jadwal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _jadwalStaete createState() => _jadwalStaete();
}
class _jadwalStaete extends State<jadwal> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState.validate()) {
      print("Validated");
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Dashboard Jadwal",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}