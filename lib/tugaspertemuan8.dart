import 'package:flutter/material.dart';

class tugaspertemuan8 extends StatefulWidget {
  tugaspertemuan8({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tugaspertemuan8State createState() => _tugaspertemuan8State();
}

class _tugaspertemuan8State extends State<tugaspertemuan8> {
  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            TextFormField(
              decoration:  new InputDecoration(
                icon: Icon(Icons.people_rounded),
                  labelText: "Nama Lengkap",
                  hintText: "Contoh:Yose Salawangi",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.white)
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
