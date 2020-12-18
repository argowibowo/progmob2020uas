import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Model.dart';
import 'package:flutter_app/Apiservices.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/TugasPertemuan8.dart';
import 'dart:async';

import 'package:flutter_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateMhs extends StatefulWidget {
  final String title;
  Mahasiswa mhs;
  String nimcari;

  UpdateMhs({Key key, @required this.title, @required this.mhs, @required this.nimcari}) : super(key: key);

  @override
  _UpdateMhsState createState() => _UpdateMhsState(title, mhs, nimcari);
}

class _UpdateMhsState extends State<UpdateMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  final String nimcari;
  Mahasiswa mhs;
  bool _isLoading = false;
  File _imageFile;

  _UpdateMhsState(this.title, this.mhs, this.nimcari);

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      labelText: "NIM",
                      hintText: "NIM",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    ),
                    initialValue: this.mhs.nim,
                    onSaved: (String value){
                      this.mhs.nim = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: "Nama",
                      hintText: "Nama Mahasiswa",
                    ),
                    initialValue: this.mhs.nama,
                    onSaved: (String value){
                      this.mhs.nama = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: "Alamat",
                      hintText: "Alamat Mahasiswa",
                    ),
                    initialValue: this.mhs.alamat,
                    onSaved: (String value){
                      this.mhs.alamat = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Email Mahasiswa",
                    ),
                    initialValue: this.mhs.email,
                    onSaved: (String value){
                      this.mhs.email = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  (_imageFile == null && this.mhs.foto == null)
                      ? Text('Silahkan pilih gambar')
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
                    this.mhs.foto,
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
                        new Icon(Icons.image,color: Colors.white,),
                        Text("Upload Foto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
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
                        builder: (context){
                          return AlertDialog(
                            title: Text("Simpan Data"),
                            content: Text("Apakah anda akan menyimpan data ini?"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () async{
                                  _formState.currentState.save();
                                  setState(() => _isLoading = true);
                                  this.mhs.nim_progmob = "72180195";
                                  //List<int> imageBytes = _imageFile.readAsBytesSync();
                                  //this.mhs.foto = base64Encode(imageBytes);
                                  ApiServices().updateMhsWithFoto(this.mhs, _imageFile, nimcari).then((isSuccess) {
                                    setState(() => _isLoading = false);
                                    if(isSuccess) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    } else {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }//);
                                  });
                                },
                                child: Text('Ya'),
                              ),
                              FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak"),
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
                  )
                ],
              ),
            ),
            _isLoading
                ? Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(
                    dismissible: false,
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
                : Container()
          ],
        ),
        ),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMhs(title: "apajha")),
              ).then(onGoBack);
            },
          )
        ],
      ),
      /*drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Andreas Baikhati"),
              accountEmail: Text("andreas.widya@si.ukdw.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "Ha",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            )
          ],
        ),
      ),*/
      body: Container(
          child: GestureDetector(
            child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Andreas Widya Mahendra"),
                        subtitle: Text("0812333445 - andreas.baikhati@staff.ukdw.ac.id"),
                        trailing: PopupMenuButton(
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                                child: const Text('Update'), value: 'Update'),
                            new PopupMenuItem<String>(
                                child: const Text('Delete'), value: 'Delete'),
                          ],
                        )
                      /*onLongPress: (){ //<~ /*
                        showDialog(context: null,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  children: <Widget>[
                                    FlatButton(
                                        child: Text("Edit"),
                                        onPressed: (){
                                          Navigator.pop(context); //<~ */
                                        })
                                  ],
                                ),
                              );
                            });
                      },*/
                    )
                  ],
                )
            ),
          )*/
      ),
    );
  }
}