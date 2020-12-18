import 'package:flutter/material.dart';
import 'package:flutter_app/jadwal/dashboardJadwal.dart';
import 'package:flutter_app/matakuliah/dashboardMatakuliah.dart';
import 'dosen/dashboardDosen.dart';
import 'mahasiswa/dashboardMahasiswa.dart';

class Items {
  String title;
  Items({this.title});
}

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(title: "DATA MAHASISWA");
  Items item2 = new Items(title: "DATA DOSEN");
  Items item3 = new Items(title: "DATA MATAKULIAH");
  Items item4 = new Items(title: "DATA JADWAL");

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
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
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text("Lihat Data",
                        style: TextStyle(
                          color:Colors.white,
                        )
                    ),
                    onPressed:(){
                      if(data.title == "DATA MAHASISWA"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")));
                      } else if (data.title == "DATA DOSEN"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")));
                      } else if (data.title == "DATA MATAKULIAH") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardMatakuliah(title: "Dashboard Matakuliah")));
                      } else if (data.title == "DATA JADWAL") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardJadwal(title: "Dashboard Jadwal")));
                      }
                    },
                  )
                ],
              ),
            );
          }).toList()),
    );
  }
}