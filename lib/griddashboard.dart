// import 'package:flutter/material.dart';
//
// class GridDashboard extends StatelessWidget {
//   Items item1 = new Items(
//       title: "Mahasiswa",
//       img: "assets/calendar.png");
//
//   Items item2 = new Items(
//     title: "Dosen",
//     img: "assets/food.png",
//   );
//   Items item3 = new Items(
//     title: "Matakuliah",
//     img: "assets/map.png",
//   );
//   Items item4 = new Items(
//     title: "Jadwal",
//     img: "assets/festival.png",
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     List<Items> myList = [item1, item2, item3, item4];
//     var color = Colors.pinkAccent;
//     return Flexible(
//       child: GridView.count(
//           childAspectRatio: 1.0,
//           padding: EdgeInsets.only(left: 16, right: 16),
//           crossAxisCount: 2,
//           crossAxisSpacing: 18,
//           mainAxisSpacing: 18,
//           children: myList.map((data) {
//             return Container(
//               decoration: BoxDecoration(
//                   color: Color(color), borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     data.img,
//                     width: 42,
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     data.title,
//                     style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     data.subtitle,
//                     style: TextStyle(
//                             color: Colors.white38,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     data.event,
//                     style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             );
//           }).toList()),
//     );
//   }
// }
// class Items {
//   String title;
//   String img;
//   Items({this.title, this.img});
// }