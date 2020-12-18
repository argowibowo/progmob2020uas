import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiservices.dart';
import 'package:flutter_app/model.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMatkul extends StatefulWidget {
  AddMatkul({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddMatkulState createState() => _AddMatkulState(title);
}

class _AddMatkulState extends State<AddMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddMatkulState(this.title);
  bool _isLoading = false;
  Matakuliah mk = new Matakuliah();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(this.title),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

        child: SingleChildScrollView(

          child: Stack(

            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kode",
                        hintText: "Kode Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.kode = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //UNTUK TEXTFORMFIELD NAMA
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                        hintText: "Nama Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      onSaved: (String value){
                        this.mk.nama = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Hari",
                        hintText: "Hari Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      //keyboardType: TextInputType.number,
                      onSaved: (String value){
                        this.mk.hari = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Sesi",
                        hintText: "Sesi Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      //keyboardType: TextInputType.number,
                      onSaved: (String value){
                        this.mk.sesi = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "SKS",
                        hintText: "SKS Matakuliah",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                      //keyboardType: TextInputType.number,
                      onSaved: (String value){
                        this.mk.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.lightBlue,
                      onPressed: (){
                        return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(
                                  "Simpan Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                ),
                                content: Text(
                                  "Apakah Anda akan menyimpan data ini?",
                                  style: TextStyle(
                                    color: Color(0xFF0D47A1),
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () async{
                                      _formState.currentState.save();
                                      setState(() =>_isLoading = true);
                                      this.mk.nim_progmob = "72180226";
                                      ApiServices().createMatkul(this.mk).then((isSuccess) {
                                        setState(() => _isLoading = false);
                                        if (isSuccess){
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }else{
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Ya",
                                      style: TextStyle(
                                        color: Colors.blue,

                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Tidak",
                                      style: TextStyle(
                                        color: Colors.blue,

                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
                  ? Stack(
                children: <Widget>[
                  /*Opacity(
                    opacity: 0.3,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.grey,
                    ),
                  ),*/
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                      backgroundColor: Colors.grey,
                      strokeWidth: 7,
                    ),
                  ),
                ],
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
