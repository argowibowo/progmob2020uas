
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_72170102/model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddMhs extends StatefulWidget{
  final String title;

  AddMhs({Key key, @required this.title}) : super(key: key);

  @override
  _AddMhsState createState() => new _AddMhsState(title);
}

class _AddMhsState extends State<AddMhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;

  _AddMhsState(this.title);

  bool isLoading = false;
  Mahasiswa mhs = new Mahasiswa();
  File _imageFile;


  Future<void> _pickImage(ImageSource source) async {
    File selected = (await ImagePicker.pickImage(source: source)) as File;

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
