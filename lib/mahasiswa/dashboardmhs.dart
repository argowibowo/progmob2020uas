import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmob_flutter/model.dart';
import 'package:progmob_flutter/apiservices.dart';
import 'package:progmob_flutter/mahasiswa/addmhs.dart';
import 'package:progmob_flutter/mahasiswa/updatemhs.dart';

class DashboardMhs extends StatefulWidget {
  DashboardMhs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formKey = GlobalKey<FormState>();

  List<Mahasiswa> listMhs;

  // Refresh kembali halaman dashboard
  FutureOr onGoBack(dynamic value) {
    // Refresh state
    setState(() {

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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMhs(title: "Input Data Mahasiswa"))
                ).then(onGoBack);
              }
          )
        ],
      ),

      body: FutureBuilder(
        future: ApiServices().getMahasiswa(),
        builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot) {
         if (snapshot.hasError){
           return Center(
             child: Text(
               "Something wrong with message: ${snapshot.error.toString()}"
             ),
           );
         } else if (snapshot.connectionState == ConnectionState.done) {
           // get data mahasiswa
           listMhs = snapshot.data;

           return ListView.builder(
               itemBuilder: (context, position) {
                 return Card(
                   margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                   child: Container(
                     child: ListTile(
                       title: Text(listMhs[position].nama + " - " + listMhs[position].nim),
                       subtitle: Text(listMhs[position].email),
                       leading: CircleAvatar(
                         backgroundImage: NetworkImage(listMhs[position].foto),
                       ),
                       onLongPress: () {
                         showDialog(
                             context: context,
                           builder: (_) => AlertDialog(
                             content: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>[
                                 FlatButton(
                                     onPressed: (){
                                       Navigator.pop(context);
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context) => UpdateMhs(title: "Update Data Mahasiswa",
                                             mhs: listMhs[position],
                                             nimcari: listMhs[position].nim))
                                         ).then(onGoBack);
                                     },
                                     child: Text("Update")
                                 ),
                                 Divider(
                                   color: Colors.black,
                                   height: 20,
                                 ),
                                 FlatButton(
                                     onPressed: () async {
                                       ApiServices().deleteMhs(listMhs[position].nim);
                                       Navigator.pop(context);
                                       setState(() {

                                       });
                                     },
                                     child: Text("Delete")
                                 ),
                               ],
                             ),
                           )
                         );
                       },
                     ),
                   ),
                 );
               },
             itemCount: listMhs.length,
           );
         } else {
           return Center(
             child: CircularProgressIndicator(),
           );
         }
        },
      ),
    );
  }
}