import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ippd/home/home.dart';
import 'package:ippd/pages/homepage.dart';
import 'package:ippd/pages/water.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class Exercise extends StatefulWidget {
  Exercise({Key? key}) : super(key: key);

  @override
  ExerciseState createState() => ExerciseState();
}

int age = 0;
bool a = true;

class ExerciseState extends State<Exercise> {
  Future<Null> refresh() async {
    Navigator.push(
        context,
        PageTransition(
            child: Exercise(), type: PageTransitionType.bottomToTop));

    await Future.delayed(Duration(seconds: 2));
  }

  bool load = false;

  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data();
        if (int.parse(data["yas"]) <= 18) {
          age = 17;
          load = true;
        }
        if (int.parse(data["yas"]) <= 55 || int.parse(data["yas"]) >= 19) {
          age = 19;
          load = true;
        }
        if (int.parse(data["yas"]) >= 55) {
          age = 55;
          load = true;
        }
      });
    });
  }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('egzersizler')
      .where("yas", isEqualTo: age)
      //.orderBy()
      //.where('yas',isGreaterThanOrEqualTo: )
      .snapshots();

  void initState() {
    super.initState();
    getData();

    // Or call your function here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
          body: RefreshIndicator(
        onRefresh: refresh,
        backgroundColor: Colors.blue.shade300,
        color: Colors.blue,
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (context, snapshot) {
              if (!load || !snapshot.hasData) {
                return Center(
                    child: Column(children: [
                  Padding(padding: EdgeInsets.all(20)),
                  Text("Egzersizler Hesaplanıyor",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade900)),
                  Padding(padding: EdgeInsets.all(20)),
                  SpinKitPumpingHeart(
                    color: Colors.red,
                    size: 200,
                    duration: Duration(milliseconds: 2400),
                  )
                ]));
              } else {
                return ListView(
                  children: snapshot.data!.docs.map(
                    (DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        title: Card(
                            color: Colors.blue.shade100,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2,
                                  color: Colors.blue.shade300,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: EdgeInsets.all(0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    /*leading: Icon(Icons.cases_outlined,
                                  color: Colors.amber),*/
                                    title: Text(
                                      data['egzersiz'],
                                      style: TextStyle(
                                          fontFamily: "Times New Roman",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink.shade900,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              20),
                                    ),
                                    subtitle: Text(data['günlük'],
                                        style: TextStyle(
                                            fontFamily: "Times New Roman",
                                            fontWeight: FontWeight.normal,
                                            fontSize: MediaQuery.of(context)
                                                    .textScaleFactor *
                                                16,
                                            color: Colors.pink.shade900)),
                                  ),
                                  ButtonTheme(
                                      child: ButtonBar(children: <Widget>[
                                    Container(
                                      width: 90,
                                      height: 45,
                                      child: FlatButton(
                                        color: Colors.blue.shade300,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.blue,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "İncele",
                                          style: TextStyle(
                                              fontFamily: "Times New Roman",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink.shade900),
                                        ),
                                        onPressed: () {
                                          Alert(
                                            onWillPopActive: true,
                                            closeIcon: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 3,
                                                      color: Colors.red),
                                                ),
                                                padding: EdgeInsets.all(2),
                                                child: Icon(
                                                    Icons.close_outlined,
                                                    size: 25,
                                                    color: Colors.red)),
                                            style: AlertStyle(
                                              isButtonVisible: false,
                                              backgroundColor: Colors.white70,
                                              alertElevation: 10,
                                              alertPadding: EdgeInsets.all(10),
                                              overlayColor: Colors.white,
                                              animationType:
                                                  AnimationType.shrink,
                                              animationDuration:
                                                  Duration(milliseconds: 600),
                                              alertBorder:
                                                  RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            title: data['egzersiz'],
                                            context: context,
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 25, 5, 10),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.60,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            2.8,
                                                    child: Card(
                                                      color: Colors.white,
                                                      shadowColor: Colors.black,
                                                      child: Padding(
                                                        //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0),
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(25, 25,
                                                                  25, 10),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0,
                                                                    right: 0,
                                                                    top: 0,
                                                                    bottom: 0),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    "${data['egzersiz']} için Bilgiler",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                24,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    "${data['bas']}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.3,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.295,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Image(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            image: NetworkImage('${data['image']}')),
                                                                        Positioned(
                                                                            bottom:
                                                                                40,
                                                                            right:
                                                                                0,
                                                                            child:
                                                                                Container(
                                                                              alignment: Alignment.bottomRight,
                                                                              color: Colors.white,
                                                                              width: MediaQuery.of(context).devicePixelRatio * 28,
                                                                              height: MediaQuery.of(context).devicePixelRatio * 50,
                                                                            ))
                                                                      ],
                                                                    )),
                                                                SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['1.satır']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['2.satır']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['3.satır']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['4.satır']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['5.satır']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .all(5),
                                                                    child: Text(
                                                                      'Uygun Form Ve Nefes Modeli',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Times New Roman',
                                                                          fontSize: MediaQuery.of(context).textScaleFactor *
                                                                              21,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['baslık2']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    'Egzersiz Faydaları',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                21,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Text(
                                                                    '${data['egzersizfay']}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Times New Roman',
                                                                        fontSize:
                                                                            MediaQuery.of(context).textScaleFactor *
                                                                                16,
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ).show();
                                        },
                                      ),
                                    ),
                                  ]))
                                ])),
                      );
                    },
                  ).toList(),
                );
              }
            }),
      )),
    );
  }
}
