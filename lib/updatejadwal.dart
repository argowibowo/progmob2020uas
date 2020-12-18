import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simpelproject/apiservice.dart';
import 'package:simpelproject/model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateJadwal extends StatefulWidget {
  final String title;
  Jadwal jadwal;
  String kodecari;

  UpdateJadwal({Key key, @required this.title, @required this.jadwal, @required this.kodecari}) : super(key: key);

  @override
  _UpdateJadwalState createState() => _UpdateJadwalState(title, jadwal, kodecari);
}

class _UpdateJadwalState extends State<UpdateJadwal> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String kodecari;
  Jadwal jadwal;
  bool isLoading = false;

  _UpdateJadwalState(this.title, this.jadwal, this.kodecari);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Kode",
                          hintText: "Kode Jadwal",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.jadwal.id,
                      onSaved: (String value) {
                        this.jadwal.id = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Hari",
                          hintText: "Hari",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.jadwal.hari.toString(),
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        this.jadwal.hari = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Ruangan",
                          hintText: "Ruangan",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.jadwal.ruangan.toString(),
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        this.jadwal.ruangan = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Sesi",
                          hintText: "Sesi",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.jadwal.sesi.toString(),
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        this.jadwal.sesi = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Jam",
                          hintText: "Jam",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.jadwal.jam.toString(),
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        this.jadwal.jam = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Ubah Data"),
                              content: Text("Sudah yakin dengan data ini ?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => isLoading = true);
                                      this.jadwal.nim_progmob = "72180268";
                                      ApiServices().updateJadwal(this.jadwal, kodecari).then((isSuccess) {
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