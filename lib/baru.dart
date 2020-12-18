import 'package:flutter/material.dart';
import 'package:flutter_app/Mahasiswa/dashboardmahasiswa.dart';


class db extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu, color: Colors.white,size: 52.0,),
                      Image.network("https://scontent.fjog3-1.fna.fbcdn.net/v/t1.0-9/79881200_2301411990150202_8768215695159721984_n.jpg?_nc_cat=109&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeGVqgTyLd9s4j4UgDbcEUv1HtnBmeNJcroe2cGZ40lyunSqS4mrpW5I8-JxJMwvXw5xTnVn00URTGt6DmTUlMxj&_nc_ohc=XbW9L5Y7y5wAX-fZNaO&_nc_ht=scontent.fjog3-1.fna&oh=184415bc585d1c53ca08960a92533849&oe=6002DEDC",width: 52.0,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "WELCOME PAK ARGO \nMari di pilih",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing:20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/SpongeBob_SquarePants_character.svg/1200px-SpongeBob_SquarePants_character.svg.png",width: 64.0,),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      RaisedButton(
                                          color: Colors.black,
                                          child: Text(
                                              'Mahasiswa',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              )
                                          ),
                                          onPressed: ()  {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Mahasiswadb(title: "UAS PROGMOB",)),
                                            );
                                          }
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "CRUD",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/note.png",width: 64.0,),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Notes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "12 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/calendar.png",width: 64.0,),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Agenda",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "4 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: Card(

                            color: Color.fromARGB(255,21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/settings.png",width: 64.0,),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "6 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
