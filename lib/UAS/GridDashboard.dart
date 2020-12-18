import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_progmob/UAS/API/apiservices.dart';
import 'package:flutter_progmob/UAS/API/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';
import 'dart:async';

class GridDashboard extends StatelessWidget {
  GridDashboard(this.mhs, this.dos, this.mtk, this.jdw);
  String mhs;
  String dos;
  String mtk;
  String jdw;

  @override
  Widget build(BuildContext context) {
    Items item1 = new Items(
      title: "Mahasiswa",
      subtitle: "",
      event: mhs,
        img: "assets/Student.jpg",
      wd:60
    );
    Items item2 = new Items(
      title: "Dosen",
      subtitle: "",
      event: dos,
      img: "assets/dos.png",
        wd:60
    );
    Items item3 = new Items(
      title: "Matakuliah",
      subtitle: "",
      event: mtk,
      img: "assets/Mat.png",
        wd:60
    );
    Items item4 = new Items(
      title: "Jadwal",
      subtitle: "",
      event: jdw,
      img: "assets/cal.png",
        wd:90
    );
    List<Items> myList = [item1, item2, item3, item4];
    //var color = ;

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: data.wd,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),


                  Text(
                    data.event!=null?data.event:'Loading',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}
class Items{
  String title;
  String subtitle;
  String event;
  String img;
  double wd;

  Items({this.title,this.subtitle,this.event,this.img,this.wd});

}