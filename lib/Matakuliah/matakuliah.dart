import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class matakuliah extends StatefulWidget {
  matakuliah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _matakuliahState createState() => _matakuliahState();
}

class _matakuliahState extends State<matakuliah> {
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
          child: Text("Matakuliah",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}