import 'package:flutter/material.dart';

class TugasPertemuan8 extends StatefulWidget {
  TugasPertemuan8({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TugasPertemuan8State createState() => _TugasPertemuan8State();
}

class _TugasPertemuan8State extends State<TugasPertemuan8> {
  int _counter = 0;
  final _text = TextEditingController();
  bool _validate = false;

  void dispose(){
    _text.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TextFormField(
              controller: _text,
              decoration: new InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  size: 65,
                ),
                labelText: "Nama Lengkap",
                errorText: _validate ? 'Nama tidak boleh kosong' : null,
                hintText: "Contoh Ronaldo Slipknot",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              color: Colors.black45,
              child: Text('Save'),
              textColor: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}