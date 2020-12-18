import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey <ScaffoldState>();

class AddDosen extends StatefulWidget{
  final String title;

  AddDosen({Key key, @required this.title}) : super(key: key);

  @override
  _AddDosenState createState() => new _AddDosenState(title);
}

class _AddDosenState extends State<AddDosen>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _AddDosenState(this.title);
  bool _isLoading = false;
  Dosen dosen = new Dosen();
  File  _imageFile;

  //Pilih Foto
  Future<void> _pickImage(ImageSource source) async{
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
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
                            labelText: "NIDN",
                            hintText: "NIDN",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          ),
                          onSaved: (String value){
                            this.dosen.nidn = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Nama",
                            hintText: " Nama Dosen",
                          ),
                          onSaved: (String value){
                            this.dosen.nama=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            border: OutlineInputBorder(),
                            labelText: "Alamat",
                            hintText: " Alamat Dosen",
                          ),
                          onSaved: (String value){
                            this.dosen.alamat=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            hintText: "Email Dosen",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.dosen.email = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            border: OutlineInputBorder(),
                            labelText: "Gelar",
                            hintText: " Gerar Dosen",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this.dosen.gelar = value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _imageFile == null
                            ? Text('Pilih Gambar')
                            : Image.file(
                          _imageFile,
                          fit: BoxFit.cover,
                          height: 300.0,
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            color:  Colors.blue,
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.image_aspect_ratio,
                                  color: Colors.white,),
                                Text ("Upload Foto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            )
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
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Simpan Data"),
                                  content: Text("Apakah Data ini akan di Simpan?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () async{
                                        _formState.currentState.save();
                                        this.dosen.nim_progmob = "72180264";
                                        setState(() => _isLoading = true);
                                        List<int> imagesBytes = _imageFile.readAsBytesSync();
                                        this.dosen.foto = base64Encode(imagesBytes);
                                        ApiServices().createDosenWithFoto(this.dsn, _imageFile, _imageFile.path).then((isSuccess){
                                          setState(() => _isLoading = false);
                                          if (isSuccess){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else{
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Text("Ya"),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text ("Tidak"),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text("Simpan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                _isLoading
                    ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child:  CircularProgressIndicator(),

                    )
                  ],
                )
                    : Container(),
              ],
            ),
          )
      ),
    );
  }
}