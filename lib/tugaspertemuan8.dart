import 'package:flutter/material.dart';


class tugaspertemuan8 extends StatefulWidget {
  final String title;

  tugaspertemuan8({Key key, this.title}) : super(key: key);


@override
_tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Pertemuan Pertama",
        ),


      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
            TextFormField(
            style: TextStyle(
              color: Colors.black,
    ),
              decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "contoh: Morgan Haloho",
                  icon: Icon(Icons.android),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.only(topRight:Radius.circular(8)),
                  )
              ),
            ),
            RaisedButton(
            child: Container(
              child: Text(
              "Submit",
              style: TextStyle(
            fontSize: 18,
            color: Colors.black,
    ),
    ),
    ),
              color: Colors.blue,




            )
          ],
          ),
        ),
      ),
    );
  }
}

