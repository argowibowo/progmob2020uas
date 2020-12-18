import 'dart:io';
import 'package:flutter/material.dart';
import 'package:progmob_aftuts/API/apiService.dart';
import 'package:progmob_aftuts/model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDosen extends StatefulWidget {
  final String title;
  Dosen dosen;
  String nidncari;

  UpdateDosen({Key key, @required this.title, @required this.dosen, @required this.nidncari}) : super(key: key);

  @override
  _UpdateDosenState createState() => _UpdateDosenState(title, dosen, nidncari);
}

class _UpdateDosenState extends State<UpdateDosen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nidncari;
  Dosen dosen;
  bool isLoading = false;
  File _imageFile;

  _UpdateDosenState(this.title, this.dosen, this.nidncari);

  // Select image from galery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

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
                          labelText: "NIDN",
                          hintText: "NIDN",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.dosen.nidn,
                      onSaved: (String value) {
                        this.dosen.nidn = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Nama",
                          hintText: "Nama Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.dosen.nama,
                      onSaved: (String value) {
                        this.dosen.nama = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Alamat",
                          hintText: "Alamat Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.dosen.alamat,
                      onSaved: (String value) {
                        this.dosen.alamat = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email Mahasiswa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      keyboardType: TextInputType.emailAddress,
                      initialValue: this.dosen.email,
                      onSaved: (String value) {
                        this.dosen.email = value;
                      },
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Gelar",
                          hintText: "Gelar Dosen",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                      initialValue: this.dosen.gelar,
                      onSaved: (String value) {
                        this.dosen.gelar = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Ternary Operation -> objek ? true : false atau else
                    (_imageFile == null && this.dosen.foto == null)
                        ?
                    Text("Silahkan memilih gambar terlebih dahulu")
                        :
                    (_imageFile != null)
                        ?
                    Image.file(
                      _imageFile,
                      fit: BoxFit.cover,
                      height: 300.0,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    )
                        :
                    Image.network(
                      this.dosen.foto,
                      fit: BoxFit.cover,
                      height: 300.0,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.image, color: Colors.white,),
                          Text(
                            "Upload Foto",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
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
                              content: Text("Apakah Anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _formState.currentState.save();
                                      setState(() => isLoading = true);
                                      this.dosen.nim_progmob = "72180234";
                                      ApiServices().updateDosenWithFoto(this.dosen, _imageFile, nidncari).then((isSuccess) {
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