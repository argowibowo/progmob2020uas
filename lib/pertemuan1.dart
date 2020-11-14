import 'package:flutter/material.dart';
class Pertemuan1 extends StatefulWidget{
  Pertemuan1({Key key, this.title}) :super(key:key);
  final String title;

  @override
  _Pertemuan1State createState()=> _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1>{
  int _counter = 2;

  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
  @override
  //widget build adalah fungsi untuk membangun antar muka sekaligus fungsi
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Column( //kalo pake colomn nanti tulisannya akan kebawah
          //kalo mau ke samping, pakai ROW
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                //jarak biar gk mepet
                padding: EdgeInsets.all(16.0),
              ),
              //MEMBUAT TEXT INPUT
              /*TextFormField(
                decoration: new InputDecoration(
                  labelText: "Tes Input",
                  hintText: "Teks yang ditampilkan"
                  //MEMBUAT BORDER OUTLINE
                  border: OutlineInputBorder(
                  borderRadius : new BorderRadius.circular(5),
                  ),
                ),
              )*/
              //MEMBUAT BUTTON
              RaisedButton(
                //warna button
                color: Colors.blue,
                //nambahkan text pakai child (cuma bisa 1 kalo chilc, kalo banyak pake children)
                child:
                  Text(
                    //membuat text pada button
                    "Simpan",
                    style: TextStyle(
                      //kasih warna text
                      color: Colors.white
                    ),
                  )
              )
            ]
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child : Icon(Icons.add),
      ),*/
    );
  }
}
