import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_progmob2020/apiServices.dart';
import 'package:flutter_app_progmob2020/model.dart';

class UpdateMatkul extends StatefulWidget {
  final String title;
  Matakuliah matkul;
  String kodecari;

  UpdateMatkul({Key key, @required this.title, @required this.matkul, @required this.kodecari}) : super(key: key);

  @override
  _UpdateMatkulState createState() => _UpdateMatkulState(title, matkul, kodecari);
}

class _UpdateMatkulState extends State<UpdateMatkul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  Matakuliah matkul;
  bool isLoading = false;

  _UpdateMatkulState(this.title, this.matkul, this.kodecari);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown[700],
      ),
      backgroundColor: Colors.red[100],

      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Kode",
                          hintText: "Kode Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.matkul.kode,
                      onSaved: (String value) {
                        this.matkul.kode = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.matkul.nama,
                      onSaved: (String value) {
                        this.matkul.nama = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Hari",
                          hintText: "Hari Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.matkul.hari.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.hari = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Kode",
                          hintText: "Kode Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.matkul.sesi.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sesi = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "SKS",
                          hintText: "SKS Matakuliah",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.matkul.sks.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        this.matkul.sks = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.brown,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Ubah Data"),
                              content: Text("Apakah data ini akan anda simpan ?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => isLoading = true);
                                      this.matkul.nim_progmob = "72180239";
                                      ApiServices().updateMatkul(this.matkul, kodecari).then((isSuccess) {
                                        setState(() => isLoading = false);
                                        if (isSuccess) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        } else {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("Ya")
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak")
                                )
                              ],
                            );
                          },
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Center(
              //   child: CircularProgressIndicator(),
              // )
              isLoading
                  ? Stack(
                children: <Widget>[
                  // Opacity(
                  //   opacity: 0.3,
                  //   child: ModalBarrier(
                  //     dismissible: false,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
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