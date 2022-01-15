import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:page_transition/page_transition.dart';

class Bildirim extends StatefulWidget {
  Bildirim({Key? key}) : super(key: key);

  @override
  _BildirimState createState() => _BildirimState();
}

class _BildirimState extends State<Bildirim> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  bool a = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 550,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.blue.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(
                            "Egzersiz Takibi",
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        16),
                          ),
                          subtitle: Text(
                            "Egzersiz Bilgisi",
                            style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        16),
                          ),
                          leading:
                              Icon(Icons.notifications_active), //başına ikon
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
