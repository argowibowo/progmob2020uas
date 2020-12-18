// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final nimnikController = TextEditingController();
//   final passwordController = TextEditingController();
//   String message = "";
//
//   @override
//   void dispose(){
//     nimnikController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
//       body: Column(
//         children: <Widget>[
//           Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//           child: Form(key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 onSaved: (input)=> user.nimnik = input,
//               validator: (value){
//                 if(value.isEmpty){
//                   return "Nama Tidak Boleh Kosong";
//                 }
//               },
//               decoration: new InputDecoration(
//                   icon: Icon(Icons.person),
//                   labelText: "Username",
//                   hintText: "Masukkan Username",
//                   border: OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10)
//                   )
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             TextFormField(
//               onSaved: (input)=> user.password = input,
//               obscureText: true,
//               validator: (value){
//                 if(value.isEmpty){
//                   return "Password Tidak Boleh Kosong";
//                 }
//               },
//               decoration: new InputDecoration(
//                   icon: Icon(Icons.lock),
//                   labelText: "Password",
//                   hintText: "Masukkan Password",
//                   border: OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10)
//                   )
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//               ],
//             ),
//           ),
//           )
//         ],
//       ),
//     );
//   }
// }
